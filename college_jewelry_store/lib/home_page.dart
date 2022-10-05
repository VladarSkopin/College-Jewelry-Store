
import 'package:college_jewelry_store/screens/browse_screen.dart';
import 'package:college_jewelry_store/screens/cart_screen.dart';
import 'package:college_jewelry_store/screens/order_screen.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static List<Widget> _pages = [
    OrderScreen(),
    BrowseScreen(),
    CartScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('ЮВЕЛИРНАЯ МАСТЕРСКАЯ'), centerTitle: true),
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
    );
  }
}
