
import 'package:college_jewelry_store/db/users_database.dart';
import 'package:flutter/material.dart';

import '../db/cart_database.dart';

class AdminDbPage extends StatefulWidget {
  const AdminDbPage({Key? key}) : super(key: key);

  @override
  State<AdminDbPage> createState() => _AdminDbPageState();
}

class _AdminDbPageState extends State<AdminDbPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('СТРАНИЦА АДМИНИСТРАТОРА')),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFfff4e8),
                    Color(0xFFfff6e9),
                    Color(0xFFfff7ea),
                    Color(0xFFfef9ec),
                    Color(0xFFfefaed),
                    Color(0xFFfefcef),
                    Color(0xFFfdfdf0),
                    Color(0xFFfdfff2),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text('Администрирование пользователей:',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ), textAlign: TextAlign.center),
                const SizedBox(height: 30),
                MaterialButton(
                    onPressed: () async {

                      await UsersDatabase.instance.deleteAllUsers();

                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: Colors.purple,
                            title: const Text(
                                'ВСЕ ПОЛЬЗОВАТЕЛИ УДАЛЕНЫ ИЗ БАЗ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                                textAlign: TextAlign.center),
                            content: const Text('\nБаза пуста и готова к заполнению новыми пользователями',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Ок',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 28)),
                              ),
                            ],
                          ));
                    },
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    elevation: 6.0,
                    shape: const StadiumBorder(
                        side: BorderSide(
                            color: Color(0xFF4A93FF)
                        )
                    ),
                    child: const Text(
                        'УДАЛИТЬ ВСЕХ ПОЛЬЗОВАТЕЛЕЙ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ))),
                const SizedBox(height: 60),
                const Text('Администрирование каталога:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ), textAlign: TextAlign.center),
                const SizedBox(height: 30),
                MaterialButton(
                    onPressed: () {

                    },
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    elevation: 6.0,
                    shape: const StadiumBorder(
                        side: BorderSide(
                            color: Color(0xFF4A93FF)
                        )
                    ),
                    child: const Text(
                        'ОЧИСТИТЬ ВСЕ ИСТОРИИ ОПЕРАЦИЙ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ))),
                const SizedBox(height: 50),
                MaterialButton(
                    onPressed: () async {
                      await CartDatabase.instance.deleteAll();

                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: Colors.purple,
                            title: const Text(
                                'ВСЕ КОРЗИНЫ ОЧИЩЕНЫ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                                textAlign: TextAlign.center),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Ок',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 28)),
                              ),
                            ],
                          ));

                    },
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    elevation: 6.0,
                    shape: const StadiumBorder(
                        side: BorderSide(
                            color: Color(0xFF4A93FF)
                        )
                    ),
                    child: const Text(
                        'ОЧИСТИТЬ ВСЕ КОРЗИНЫ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ))),

              ],
            ),
          )
      ),
    );
  }
}
