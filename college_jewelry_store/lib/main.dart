import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

import 'models/cart_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color(0xFF06283D)
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Color(0xFFDFF6FF),
          backgroundColor: Color(0xFF06283D)
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF06283D),
          selectedItemColor: Color(0xFFDFF6FF),
          unselectedItemColor: Color(0xFF47B5FF),
          selectedIconTheme: IconThemeData(
              size: 30
          ),
          unselectedIconTheme: IconThemeData(
              size: 15
          ),
          showUnselectedLabels: false,
          selectedLabelStyle: TextStyle(
            color: Color(0xFFDFF6FF),
            fontSize: 18
          ),
        )
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartManager())
        ],
          child: const HomePage()
      )
    );
  }
}
