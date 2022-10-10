
import 'package:college_jewelry_store/welcome_page.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  late final FocusNode _emailFocusNode;
  late final FocusNode _loginFocusNode;
  late final FocusNode _passwordFocusNode;

  final _txtStyle = const TextStyle(color: Color(0xFF256D85), fontSize: 20);
  final _btnTxtStyle = TextStyle(color: Colors.white, fontSize: 18);

  String _userName = '';
  String _email = '';
  String _login = '';
  String _password = '';


  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _loginFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
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
      appBar: AppBar(title: Text('РЕГИСТРАЦИЯ')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('Введите ваше имя, адрес электронной почты, логин и пароль: ', style: _txtStyle, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: TextFormField(
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
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
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
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email_outlined),
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
              onPressed: () {

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
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
