
import 'package:college_jewelry_store/screens/admin_db_page.dart';
import 'package:college_jewelry_store/screens/collection_screen.dart';
import 'package:college_jewelry_store/screens/custom_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  String login = 'anonymous';
  //late String login;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCurrentUserLogin();
  }

  Future loadCurrentUserLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      login = prefs.getString('login') ?? 'anonymous';
    });
  }

  @override
  Widget build(BuildContext context) {

    /*
    return Center(
      child: (login == 'admin') ? buildAdminMenu() : buildNormalMenu(),
    );*/

    if (login == 'admin') {
      return buildAdminMenu();
    } else {
      return buildNormalMenu();
    }

  }


  Widget buildNormalMenu() {
    return Container(
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
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text('Здесь вы можете собрать свой заказ:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ), textAlign: TextAlign.center),
            const SizedBox(height: 30),
            MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          alignment: Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 800),
                          child: const CustomOrderScreen()
                      )
                  );
                },
                color: const Color(0xFF256D85),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                elevation: 6.0,
                shape: const StadiumBorder(
                    side: BorderSide(
                        color: Color(0xFF4A93FF)
                    )
                ),
                child: const Text('ПОИСК ИЗДЕЛИЙ', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ))),
            const SizedBox(height: 80),
            const Text('Хотите посмотреть нашу полную коллекцию?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ), textAlign: TextAlign.center),
            const SizedBox(height: 30),
            MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          alignment: Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 800),
                          child: const CollectionScreen()
                      )
                  );
                },
                color: const Color(0xFF256D85),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                elevation: 6.0,
                shape: const StadiumBorder(
                    side: BorderSide(
                        color: Color(0xFF4A93FF)
                    )
                ),
                child: const Text('ПЕРЕЙТИ В КАТАЛОГ', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ))),

          ],
        )
    );
  }


  Widget buildAdminMenu() {
    return Container(
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text('Т.к. вы являетесь администратором сервиса, вы можете редактировать базы данных:',
                style: TextStyle(
                  color: Colors.purple,
                    fontSize: 22,
                    fontWeight: FontWeight.w500
                ), textAlign: TextAlign.center),
              ),
              const SizedBox(height: 30),
              MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.bottomCenter,
                            duration: const Duration(milliseconds: 800),
                            child: const AdminDbPage()
                        )
                    );
                  },
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  elevation: 6.0,
                  shape: const StadiumBorder(
                      side: BorderSide(
                          color: Color(0xFF4A93FF)
                      )
                  ),
                  child: const Text('ПЕРЕЙТИ В БАЗЫ ДАННЫХ', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ))),
              const SizedBox(height: 50),
              const Text('Здесь вы можете собрать свой заказ:',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ), textAlign: TextAlign.center),
              const SizedBox(height: 30),
              MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.bottomCenter,
                            duration: const Duration(milliseconds: 800),
                            child: const CustomOrderScreen()
                        )
                    );
                  },
                  color: const Color(0xFF256D85),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  elevation: 6.0,
                  shape: const StadiumBorder(
                      side: BorderSide(
                          color: Color(0xFF4A93FF)
                      )
                  ),
                  child: const Text('ПОИСК ИЗДЕЛИЙ', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ))),
              const SizedBox(height: 50),
              const Text('Хотите посмотреть нашу полную коллекцию?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ), textAlign: TextAlign.center),
              const SizedBox(height: 30),
              MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            alignment: Alignment.bottomCenter,
                            duration: const Duration(milliseconds: 800),
                            child: const CollectionScreen()
                        )
                    );
                  },
                  color: const Color(0xFF256D85),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  elevation: 6.0,
                  shape: const StadiumBorder(
                      side: BorderSide(
                          color: Color(0xFF4A93FF)
                      )
                  ),
                  child: const Text('ПЕРЕЙТИ В КАТАЛОГ', style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ))),
              const SizedBox(height: 50),


            ],
          ),
        )
    );
  }
}
