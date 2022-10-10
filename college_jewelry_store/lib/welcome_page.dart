
import 'package:college_jewelry_store/db/users_database.dart';
import 'package:college_jewelry_store/models/cart_manager.dart';
import 'package:college_jewelry_store/models/users_model.dart';
import 'package:college_jewelry_store/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  late final FocusNode _passwordFocusNode;

  final _txtStyle = const TextStyle(color: Color(0xFF256D85), fontSize: 20);
  final _btnTxtStyle = TextStyle(color: Colors.white, fontSize: 18);

  String _login = '';
  String _password = '';

  @override
  void initState() {
    super.initState();
    initializeAdmin();
    _passwordFocusNode = FocusNode();
  }

  Future initializeAdmin() async {
    User userAdmin = User(userName: 'Администратор', login: 'admin', email: 'grudagor@gmail.com', password: '1qaz@WSXmobuser');

    await UsersDatabase.instance.createAdmin(userAdmin);
  }

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
          appBar: AppBar(title: Text('ДОБРО ПОЖАЛОВАТЬ!')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Введите ваш логин и пароль: ', style: _txtStyle, textAlign: TextAlign.center),
                const SizedBox(height: 20),
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
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.login),
                      hintText: 'Логин: ',
                      hintStyle: TextStyle(
                        fontSize: 18, color: Colors.grey[500]
                      ),
                      //filled: true,
                      //fillColor: Colors.white,
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
                        _password = text;
                      });
                    },
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Colors.purple,
                    cursorWidth: 1.8,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      hintText: 'Пароль: ',
                      hintStyle: TextStyle(
                          fontSize: 18, color: Colors.grey[500]
                      ),
                      //filled: true,
                      //fillColor: Colors.white,
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
                const SizedBox(height: 60),
                MaterialButton(
                  onPressed: () {


                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()));
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
                const SizedBox(height: 20),
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
