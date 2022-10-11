
import 'package:college_jewelry_store/db/users_database.dart';
import 'package:college_jewelry_store/models/cart_manager.dart';
import 'package:college_jewelry_store/models/users_model.dart';
import 'package:college_jewelry_store/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  late final FocusNode _passwordFocusNode;

  final _txtStyle = const TextStyle(color: Color(0xFFBBDAE7), fontSize: 20);
  final _btnTxtStyle = const TextStyle(color: Colors.white, fontSize: 18);
  final _fieldTxtStyle = const TextStyle(color: Colors.blueAccent, fontSize: 18);

  String _login = '';
  String _password = '';

  String _alertMessage = '';

  @override
  void initState() {
    super.initState();
    //initializeAdmin();
    _passwordFocusNode = FocusNode();
  }

 /*
  Future initializeAdmin() async {
    User userAdmin = User(userName: 'Администратор', login: 'admin', email: 'grudagor@gmail.com', password: 'mobadmin');

    await UsersDatabase.instance.createAdmin(userAdmin);
  }
 */

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartManager>(
      builder: (context, cartManager, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text('ДОБРО ПОЖАЛОВАТЬ!')),
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF011411),
                    Color(0xFF001717),
                    Color(0xFF001a21),
                    Color(0xFF001b2e),
                    Color(0xFF001a3b),
                    Color(0xFF001847),
                    Color(0xFF00144f),
                    Color(0xFF02084f),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text('Введите ваш логин и пароль: ', style: _txtStyle, textAlign: TextAlign.center),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: TextFormField(
                    onChanged: (text) {
                      setState(() {
                        _login = text.trim();
                      });
                    },
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.purple,
                    cursorWidth: 1.8,
                    textAlign: TextAlign.center,
                    style: _fieldTxtStyle,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.login),
                      hintText: 'Логин: ',
                      hintStyle: TextStyle(
                        fontSize: 18, color: Colors.grey[500]
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purple[300]!,
                              width: 4
                          )
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: TextFormField(
                    focusNode: _passwordFocusNode,
                    onChanged: (text) {
                      setState(() {
                        _password = text.trim();
                      });
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.purple,
                    cursorWidth: 1.8,
                    textAlign: TextAlign.center,
                    style: _fieldTxtStyle,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      hintText: 'Пароль: ',
                      hintStyle: TextStyle(
                          fontSize: 18, color: Colors.grey[500]
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.purple[300]!,
                              width: 4
                          )
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                MaterialButton(
                  onPressed: () async {

                    bool loginExists = await UsersDatabase.instance.readUserLogin(_login);
                    bool passwordCorrect = await UsersDatabase.instance.readUserPassword(_password);

                    if (!loginExists && !passwordCorrect) {
                      setState(() {
                        _alertMessage = 'Неизвестный логин и пароль';
                      });
                    } else if (!loginExists) {
                      setState(() {
                        _alertMessage = 'Пользователя с таким логином не существует. Попробуйте другой логин';
                      });
                    } else if (!passwordCorrect) {
                      setState(() {
                        _alertMessage = 'Логин корректный, но пароль не подходит';
                        });
                    } else {
                      String name = await UsersDatabase.instance.getUserName(_login);
                      setState(() {
                        _alertMessage = 'Добро пожаловать, $name';
                      });

                      // !!!
                      // SHARED PREFERENCES -> SAVE CURRENT LOGIN !!!
                      // !!!

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setString('login', _login);

                      //Provider.of<CartManager>(context, listen: false).currentUserLogin = _login;

                      await Future.delayed(const Duration(milliseconds: 500));

                      Navigator.pushReplacement(
                          context,
                          //MaterialPageRoute(builder: (context) => const HomePage())
                          PageTransition(
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 1200),
                              child: const HomePage()));
                    }

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor: const Color(0xFFDFF6FF),
                          title: Text(
                              _alertMessage,
                              style: const TextStyle(
                                  color: Color(0xFF256D85), fontSize: 24),
                              textAlign: TextAlign.center),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ок',
                                  style: TextStyle(
                                      color: Color(0xFF47B5FF), fontSize: 28)),
                            ),
                          ],
                        ));


                  },
                  color: const Color(0xFF256D85),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  elevation: 6.0,
                  shape:
                  const StadiumBorder(side: BorderSide(color: Color(0xFF4A93FF))),
                  child: Text('ВОЙТИ', style: _btnTxtStyle),
                ),
                const SizedBox(height: 80),
                Text('Ещё не зарегистрированы?', style: _txtStyle),
                const SizedBox(height: 30),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationPage()));
                  },
                  color: const Color(0xFF256D85),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  elevation: 6.0,
                  shape:
                  const StadiumBorder(side: BorderSide(color: Color(0xFF4A93FF))),
                  child: Text('ПЕРЕЙТИ К РЕГИСТРАЦИИ', style: _btnTxtStyle),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        );
      }
    );
  }
}
