
import 'package:flutter/material.dart';
import 'package:college_jewelry_store/db/users_database.dart';

import '../models/users_model.dart';

class AdminUsersListPage extends StatefulWidget {
  const AdminUsersListPage({Key? key}) : super(key: key);

  @override
  State<AdminUsersListPage> createState() => _AdminUsersListPageState();
}

class _AdminUsersListPageState extends State<AdminUsersListPage> {

  late List<User> usersList;
  bool isLoading = false;

  final _tileTxtStyle = const TextStyle(
    fontSize: 18,
  );

  @override
  void initState() {
    super.initState();
    refreshUsersList();
  }


  Future refreshUsersList() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    this.usersList = await UsersDatabase.instance.readAllUsers();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('СПИСОК ПОЛЬЗОВАТЕЛЕЙ', style: TextStyle(
            fontSize: 16)),
        ),
    body: isLoading ? const ColoredBox(
      color: Color(0xFFe3ffe8),
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
          backgroundColor: Colors.white,
          strokeWidth: 8,
        ),
      ),
    ) : usersList.isNotEmpty ? Container(
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
        child: ListView.builder(
            itemCount: usersList.length,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                child: ExpansionTile(
                  backgroundColor: const Color(0xFFFFF5B0),
                  collapsedBackgroundColor: Colors.white,
                  textColor: Colors.black,
                  //collapsedTextColor: Colors.black,
                    iconColor: Colors.purpleAccent,
                    collapsedIconColor: Colors.purple,
                  trailing: TextButton.icon(
                    onPressed: () async {
                      await UsersDatabase.instance.deleteUserByLogin(usersList[index].login);


                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            backgroundColor: Colors.purple,
                            title: Text(
                                'ПОЛЬЗОВАТЕЛЬ ${usersList[index].login} УДАЛЁН ИЗ БАЗЫ ДАННЫХ',
                                style: const TextStyle(
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

                      /*
                      setState(() {
                        usersList.removeAt(index + 1);
                      });
                      */

                      refreshUsersList();

                    },
                    icon: const Icon(Icons.delete),
                    label: const Text(
                      'Удалить из БД',
                    ),
                    style: TextButton.styleFrom(foregroundColor: const Color(
                        0xFFDC2400)),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(usersList[index].login, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    childrenPadding: const EdgeInsets.symmetric(vertical: 10),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('userName: ${usersList[index].userName}', style: _tileTxtStyle),
                    const SizedBox(height: 20),
                    Text('email: ${usersList[index].email}', style: _tileTxtStyle),
                    const SizedBox(height: 20),
                    Text('password: ${usersList[index].password}', style: _tileTxtStyle),
                    const SizedBox(height: 20),
                    Text('registrationDate: ${usersList[index].registrationDate}', style: _tileTxtStyle),
                    const SizedBox(height: 10),
                  ]
                ),
              );
            }
        )
      ),
    ) : ColoredBox(
      color: const Color(0xFFe3ffe8),
      child: RefreshIndicator(
        onRefresh: () async {
          refreshUsersList();
        },
        color: Colors.white,
        backgroundColor: const Color(0xFF9C2C77),
        strokeWidth: 4,
        edgeOffset: 10,
        displacement: 80.0,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 2 - 200),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                  'База данных пользователей пуста. Возможно требуется обновить страницу',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                  textAlign: TextAlign.center),
            ),
            const SizedBox(height: 30),
            Center(
              child: MaterialButton(
                  onPressed: () {
                    refreshUsersList();
                  },
                  color: Colors.lightBlueAccent,
                  shape: const StadiumBorder(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                          Icons.refresh,
                          color: Color(0xFFDFF6FF),
                          size: 28
                      ),
                      SizedBox(width: 10),
                      Text(
                          'Обновить',
                          style: TextStyle(
                              color: Color(0xFFDFF6FF),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          )),
                    ],
                  )),
            )
          ],
        ),
      ),
    )
        )
    );
  }
}
