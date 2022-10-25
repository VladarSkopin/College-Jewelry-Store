
import 'package:college_jewelry_store/screens/browse_screen.dart';
import 'package:college_jewelry_store/screens/cart_screen.dart';
import 'package:college_jewelry_store/screens/order_screen.dart';
import 'package:college_jewelry_store/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'models/cart_manager.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget> [
    const OrderScreen(),
    const BrowseScreen(),
    const CartScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartManager(),
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                  title: const Text('ЮВЕЛИРНАЯ МАСТЕРСКАЯ'),
                actions: [
                  PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: const [
                            Icon(Icons.logout),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Выйти из приложения", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: Row(
                          children: const [
                            Icon(Icons.info_outline_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text("О приложении", style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, 50),
                    color: const Color(0xFF4A93FF),
                    elevation: 2,
                    onSelected: (value) {
                      if (value == 1) {

                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 800),
                              child: const WelcomePage()
                            ));

                      } else if (value == 2) {

                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                      'Приложениe для сети ювелирных мастерских ИСРПО. '
                                          '\n\nАвтор: \nСкопинцев Александр Александрович. '
                                      '\n\nКонтакты: \ngrudagor@gmail.com',
                                  style: TextStyle(
                                      color: Color(0xFF256D85)),
                                  textAlign: TextAlign.left),
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
                  ),
                ],
              ),
              body: _pages[_selectedIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.diamond_outlined),
                      label: 'Заказ'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list_alt),
                      label: 'Каталог'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_outlined),
                      label: 'Корзина'
                  ),

                ],

              ),
            ),
          )
    );
  }

}
