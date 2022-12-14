
import 'package:college_jewelry_store/db/operation_history_database.dart';
import 'package:college_jewelry_store/db/users_database.dart';
import 'package:college_jewelry_store/screens/admin_operations_history_page.dart';
import 'package:college_jewelry_store/screens/admin_users_list_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
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
                    Color(0xFF19261b),
                    Color(0xFF1a251a),
                    Color(0xFF1b2419),
                    Color(0xFF1b2318),
                    Color(0xFF1c2217),
                    Color(0xFF1c2117),
                    Color(0xFF1d2016),
                    Color(0xFF1d1f16),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
              )
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text('Администрирование пользователей:',
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ), textAlign: TextAlign.center),
                  const SizedBox(height: 30),
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                            child: const AdminUsersListPage()
                          )
                        );
                      },
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Colors.white,
                            width: 0.8
                          )
                      ),
                      child: const Text(
                          'СПИСОК ПОЛЬЗОВАТЕЛЕЙ', style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ))),
                  const SizedBox(height: 40),
                  MaterialButton(
                      onPressed: () async {

                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.purple,
                              title: const Text(
                                  'Вы уверены, что хотите удалить ВСЕХ пользователей?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  textAlign: TextAlign.center),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
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
                                  child: const Text('УДАЛИТЬ ВСЕХ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('ОТМЕНА',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
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
                  const SizedBox(height: 40),
                  MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const AdminOperationsHistoryPage()
                            )
                        );
                      },
                      color: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Colors.white,
                              width: 0.8
                          )
                      ),
                      child: const Text(
                          'ИСТОРИЯ ОПЕРАЦИЙ', style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ))),
                  const SizedBox(height: 40),
                  MaterialButton(
                      onPressed: () async {

                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.purple,
                              title: const Text(
                                  'Вы уверены, что хотите удалить ВСЮ историю операций?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                  textAlign: TextAlign.center),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              actionsAlignment: MainAxisAlignment.center,
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    await OperationHistoryDatabase.instance.deleteAll();

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor: Colors.purple,
                                          title: const Text(
                                              'ИСТОРИЯ ОПЕРАЦИЙ ОЧИЩЕНА',
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
                                  child: const Text('УДАЛИТЬ',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('ОТМЕНА',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
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
                          'ОЧИСТИТЬ ВСЕ ИСТОРИИ ОПЕРАЦИЙ', style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ))),
                  const SizedBox(height: 40),
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
                  const SizedBox(height: 80),
                ],
              ),
            ),
          )
      ),
    );
  }
}
