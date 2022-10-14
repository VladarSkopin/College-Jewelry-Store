import 'package:college_jewelry_store/db/users_database.dart';
import 'package:college_jewelry_store/models/users_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  //late final FocusNode _usernameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _loginFocusNode;
  late final FocusNode _passwordFocusNode;
  late TextEditingController _textFieldController_1;
  late TextEditingController _textFieldController_2;
  late TextEditingController _textFieldController_3;
  bool _isInputTextObscure = true;

  final _txtStyle = const TextStyle(color: Color(0xFFBBDAE7), fontSize: 20);
  final _btnTxtStyle = const TextStyle(color: Colors.white, fontSize: 16);
  final _fieldTxtStyle =
      const TextStyle(color: Colors.blueAccent, fontSize: 18);
  final _counterTxtStyle = const TextStyle(
      color: Colors.lightBlueAccent
  );

  String _userName = '';
  String _email = '';
  String _login = '';
  String _password = '';

  String _registrationDate = '';

  String _errorAlertMessage = '';

  @override
  void initState() {
    super.initState();
    _textFieldController_1 = TextEditingController();
    _textFieldController_2 = TextEditingController();
    _textFieldController_3 = TextEditingController();
    //_usernameFocusNode = FocusNode();
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
      appBar: AppBar(title: const Text('РЕГИСТРАЦИЯ')),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xFF062d3b),
            Color(0xFF0a2e3e),
            Color(0xFF0f3041),
            Color(0xFF143144),
            Color(0xFF183246),
            Color(0xFF1d3349),
            Color(0xFF22344b),
            Color(0xFF27354d),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
        child: Center(
          child: Scrollbar(
            //scrollbarOrientation: ScrollbarOrientation.left,
            thumbVisibility: true,
            radius: const Radius.circular(20),
            thickness: 8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40),
                    child: TextFormField(
                      //focusNode: _usernameFocusNode,
                      controller: _textFieldController_1,
                      maxLength: 20,
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              _textFieldController_1.clear();
                              setState(() {
                                _userName = '';
                              });
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          hintText: 'Имя: ',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey[500]),
                          filled: true,
                          fillColor: Colors.white,
                          counterStyle: _counterTxtStyle,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.purple[300]!, width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2))),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40),
                    child: TextFormField(
                      focusNode: _emailFocusNode,
                      controller: _textFieldController_2,
                      maxLength: 30,
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              _textFieldController_2.clear();
                              setState(() {
                                _email = '';
                              });
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          hintText: 'Почта: ',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey[500]),
                          filled: true,
                          fillColor: Colors.white,
                          counterStyle: _counterTxtStyle,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.purple[300]!, width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2))),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40),
                    child: TextFormField(
                      focusNode: _loginFocusNode,
                      controller: _textFieldController_3,
                      maxLength: 10,
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
                          suffixIcon: IconButton(
                            onPressed: () {
                              _textFieldController_3.clear();
                              setState(() {
                                _login = '';
                              });
                            },
                            icon: const Icon(Icons.clear),
                          ),
                          hintText: 'Логин: ',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey[500]),
                          filled: true,
                          fillColor: Colors.white,
                          counterStyle: _counterTxtStyle,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.purple[300]!, width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2))),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40),
                    child: TextFormField(
                      obscureText: _isInputTextObscure,
                      focusNode: _passwordFocusNode,
                      maxLength: 100,
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
                            icon: Icon(_isInputTextObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isInputTextObscure = !_isInputTextObscure;
                              });
                            },
                          ),
                          hintText: 'Пароль: ',
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey[500]),
                          filled: true,
                          fillColor: Colors.white,
                          counterStyle: _counterTxtStyle,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Colors.purple[300]!, width: 4)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2))),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40),
                    child: MaterialButton(
                      onPressed: () async {
                        if (fieldsAreNotEmpty([_userName, _email, _login, _password])) {

                          if (!userNameIsOk(_userName) ||
                              !emailIsOk(_email) ||
                              !loginIsOk(_login) ||
                              !passwordIsOk(_password)) {

                            if (!userNameIsOk(_userName)) {
                              setState(() {
                                _errorAlertMessage +=
                                'Ошибка имени. Длина имени должна быть меньше 20 символов.\n\n';
                              });
                            }

                            if (!emailIsOk(_email)) {
                              setState(() {
                                _errorAlertMessage +=
                                'Ошибка почты. Формат адреса почты должен быть по типу "example@email.com"\n\n';
                              });
                            }

                            if (!loginIsOk(_login)) {
                              setState(() {
                                _errorAlertMessage +=
                                'Ошибка логина. Длина логина должна быть меньше 10 символов, без пробелов. Логин может состоять только из латинских букв, цифр и нижнего подчёркивания "_"\n\n';
                              });
                            }

                            if (!passwordIsOk(_password)) {
                              setState(() {
                                _errorAlertMessage +=
                                'Ошибка пароля. Пароль должен содержать хотя бы 1 цифру, 1 специальный символ, латинские буквы верхнего и нижнего регистра. Длина пароля не менее 6 символов.';
                              });
                            }

                            await showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: SingleChildScrollView(
                                    child: Text(
                                        (_errorAlertMessage.isEmpty || _errorAlertMessage == '') ? 'Неизвестная ошибка регистрации' : _errorAlertMessage,
                                        style: const TextStyle(
                                            color: Color(0xFF256D85),
                                            fontSize: 20),
                                        textAlign: TextAlign.left),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(50)),
                                  backgroundColor: const Color(0xFFDFF6FF),
                                  actionsAlignment:
                                  MainAxisAlignment.center,
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ок',
                                          style: TextStyle(
                                              color: Color(0xFF47B5FF),
                                              fontSize: 22)),
                                    ),
                                  ],
                                ));

                            setState(() {
                              _errorAlertMessage = '';
                            });


                          } else {
                            DateTime now = DateTime.now();

                            setState(() {
                              _registrationDate =
                                  DateFormat('d-MM-yyyy HH:mm:ss').format(now);
                            });

                            User newUser = User(
                                userName: _userName,
                                email: _email,
                                login: _login,
                                password: _password,
                                registrationDate: _registrationDate);

                            try {
                              await UsersDatabase.instance.create(newUser);

                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                        title: Text(
                                            'Поздравляем, $_userName! Вы успешно зарегистрировались',
                                            style: const TextStyle(
                                                color: Color(0xFF256D85),
                                                fontSize: 20),
                                            textAlign: TextAlign.center),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        backgroundColor: const Color(0xFFDFF6FF),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Ок',
                                                style: TextStyle(
                                                    color: Color(0xFF47B5FF),
                                                    fontSize: 22)),
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
                                                color: Color(0xFF256D85),
                                                fontSize: 20),
                                            textAlign: TextAlign.center),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        backgroundColor: const Color(0xFFDFF6FF),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('Ок',
                                                style: TextStyle(
                                                    color: Color(0xFF47B5FF),
                                                    fontSize: 22)),
                                          ),
                                        ],
                                      ));
                            }
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text(
                                        'Все поля должны быть заполнены',
                                        style: TextStyle(
                                            color: Color(0xFF256D85),
                                            fontSize: 20),
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
                                                color: Color(0xFF47B5FF),
                                                fontSize: 22)),
                                      ),
                                    ],
                                  ));
                        }
                      },
                      color: const Color(0xFF256D85),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      elevation: 6.0,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Color(0xFF4A93FF))),
                      child: Text('ЗАРЕГИСТРИРОВАТЬСЯ', style: _btnTxtStyle),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40),
                    child: Text('Уже зарегистрированы?', style: _txtStyle, textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0, left: 40),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: const Color(0xFF256D85),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      elevation: 6.0,
                      shape: const StadiumBorder(
                          side: BorderSide(color: Color(0xFF4A93FF))),
                      child: Text('ВХОД В ПРИЛОЖЕНИЕ', style: _btnTxtStyle, textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(height: 100)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool fieldsAreNotEmpty(List<String> fields) {
    for (String element in fields) {
      if (element.isEmpty || element == '') return false;
    }
    return true;
  }

  bool userNameIsOk(String userName) {
    if (userName.length > 1 && userName.length <= 20) {
      return true;
    }
    return false;
  }

  bool emailIsOk(String email) {
    //return EmailValidator.validate(email, true);
    return EmailValidator.validate(email);
  }

  bool loginIsOk(String login) {
    if (login.length > 10 || login.contains(' ')) {
      return false;
    }

    RegExp regex = RegExp(r'^[A-Za-z0-9_]+$');
    if (!regex.hasMatch(login)) {
      return false;
    }

    return true;
  }

  bool passwordIsOk(String password) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~^%]).{6,}$');
    if (regex.hasMatch(password)) {
      return true;
    }

    return false;
  }
}
