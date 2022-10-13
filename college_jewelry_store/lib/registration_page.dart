
import 'package:college_jewelry_store/db/users_database.dart';
import 'package:college_jewelry_store/models/users_model.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  late final FocusNode _usernameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _loginFocusNode;
  late final FocusNode _passwordFocusNode;
  late TextEditingController _textFieldController_1;
  late TextEditingController _textFieldController_2;
  late TextEditingController _textFieldController_3;
  bool _isInputTextObscure = true;

  final _txtStyle = const TextStyle(color: Color(0xFFBBDAE7), fontSize: 20);
  final _btnTxtStyle = const TextStyle(color: Colors.white, fontSize: 18);
  final _fieldTxtStyle = const TextStyle(color: Colors.blueAccent, fontSize: 18);

  String _userName = '';
  String _email = '';
  String _login = '';
  String _password = '';


  @override
  void initState() {
    super.initState();
    _textFieldController_1 = TextEditingController();
    _textFieldController_2 = TextEditingController();
    _textFieldController_3 = TextEditingController();
    _usernameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _loginFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _usernameFocusNode.addListener(() {
      if (_usernameFocusNode.hasFocus) _textFieldController_1.clear();
    });
    _emailFocusNode.addListener(() {
      if (_emailFocusNode.hasFocus) _textFieldController_2.clear();
    });
    _loginFocusNode.addListener(() {
      if (_loginFocusNode.hasFocus) _textFieldController_3.clear();
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _loginFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('РЕГИСТРАЦИЯ')),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text('Введите ваше имя, адрес электронной почты, логин и пароль: ', style: _txtStyle, textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: TextFormField(
                  focusNode: _usernameFocusNode,
                  controller: _textFieldController_1,
                  onChanged: (text) {
                    setState(() {
                      _userName = text.trim();
                    });
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.purple,
                  cursorWidth: 1.8,
                  textAlign: TextAlign.center,
                  style: _fieldTxtStyle,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      suffixIcon: const Text(' '), // to move input text to left
                      hintText: 'Имя: ',
                      hintStyle: TextStyle(
                          fontSize: 16, color: Colors.grey[500]
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.purple[300]!,
                              width: 4
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      )
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: TextFormField(
                  focusNode: _emailFocusNode,
                  controller: _textFieldController_2,
                  onChanged: (text) {
                    setState(() {
                      _email = text.trim();
                    });
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_loginFocusNode);
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.purple,
                  cursorWidth: 1.8,
                  textAlign: TextAlign.center,
                  style: _fieldTxtStyle,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      suffixIcon: const Text(' '), // to move input text to left
                      hintText: 'Почта: ',
                      hintStyle: TextStyle(
                          fontSize: 16, color: Colors.grey[500]
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.purple[300]!,
                              width: 4
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      )
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: TextFormField(
                  focusNode: _loginFocusNode,
                  controller: _textFieldController_3,
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
                      suffixIcon: const Text(' '), // to move input text to left
                      hintText: 'Логин: ',
                      hintStyle: TextStyle(
                          fontSize: 16, color: Colors.grey[500]
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Colors.purple[300]!,
                              width: 4
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2
                          )
                      )
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: TextFormField(
                  obscureText: _isInputTextObscure,
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
                  style: _fieldTxtStyle,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                            _isInputTextObscure ? Icons.visibility : Icons.visibility_off
                        ),
                        onPressed: () {
                          setState(() {
                            _isInputTextObscure = !_isInputTextObscure;
                          });
                        },
                      ),
                    hintText: 'Пароль: ',
                    hintStyle: TextStyle(
                        fontSize: 16, color: Colors.grey[500]
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.purple[300]!,
                            width: 4
                        )
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2
                        )
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () async {
                  User newUser = User(
                    userName: _userName,
                    email: _email,
                    login: _login,
                    password: _password
                  );

                  try {
                    await UsersDatabase.instance.create(newUser);

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                              'Поздравляем, $_userName! Вы успешно зарегистрировались',
                              style: const TextStyle(
                                  color: Color(0xFF256D85), fontSize: 24),
                              textAlign: TextAlign.center),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: const Color(0xFFDFF6FF),
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

                  } catch (ex) {

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                              'К сожалению, пользователь с таким логином (логин = $_login) уже существует. Попробуйте другой логин',
                              style: const TextStyle(
                                  color: Color(0xFF256D85), fontSize: 24),
                              textAlign: TextAlign.center),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor: const Color(0xFFDFF6FF),
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

                  }


                },
                color: const Color(0xFF256D85),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                elevation: 6.0,
                shape:
                const StadiumBorder(side: BorderSide(color: Color(0xFF4A93FF))),
                child: Text('ЗАРЕГИСТРИРОВАТЬСЯ', style: _btnTxtStyle),
              ),
              const SizedBox(height: 50),
              Text('Уже зарегистрированы?', style: _txtStyle),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: const Color(0xFF256D85),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                elevation: 6.0,
                shape:
                const StadiumBorder(side: BorderSide(color: Color(0xFF4A93FF))),
                child: Text('ВХОД В ПРИЛОЖЕНИЕ', style: _btnTxtStyle),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
