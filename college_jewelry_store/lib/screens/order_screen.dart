
import 'package:college_jewelry_store/screens/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  Widget build(BuildContext context) {
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
          const Text('Здесь вы можете собрать свой заказ:', style: TextStyle(
              fontSize: 20,
            fontWeight: FontWeight.w500
          ), textAlign: TextAlign.center),
          const SizedBox(height: 30),
          MaterialButton(
              onPressed: () {

              },
              color: const Color(0xFF4A93FF),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Colors.white
                )
              ),
          child: const Text('НАЧАТЬ', style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ))),
          const SizedBox(height: 80),
          const Text('Хотите посмотреть нашу полную коллекцию?', style: TextStyle(
            fontSize: 20,
              fontWeight: FontWeight.w500
          ), textAlign: TextAlign.center),
          const SizedBox(height: 30),
          MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.bottomCenter,
                    duration: const Duration(milliseconds: 1200),
                    child: const CollectionScreen()
                  )
                );
              },
              color: const Color(0xFF4A93FF),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              elevation: 6.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                      color: Colors.white
                  )
              ),
              child: const Text('КОНЕЧНО', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ))),
        ],
      )
    );
  }
}
