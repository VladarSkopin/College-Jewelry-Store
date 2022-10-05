
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('ЮВЕЛИРНАЯ МАСТЕРСКАЯ'), centerTitle: true),
        body: Center(
          child: Container(
            color: Colors.lightGreen,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [

          ],

        ),
      ),
    );
  }
}
