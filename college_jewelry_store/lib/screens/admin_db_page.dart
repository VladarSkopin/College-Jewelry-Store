
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
      appBar: AppBar(title: const Text('СТРАНИЦА АДМИНИСТРАТОРА', style: TextStyle(fontSize: 16))),
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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
              )
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text('Администрирование пользователей:',
                    style: TextStyle(
                      color: Colors.white,
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
                      color: Colors.white,
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
