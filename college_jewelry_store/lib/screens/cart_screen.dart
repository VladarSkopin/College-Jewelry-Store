
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'custom_order_screen.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFe3ffe8),
                  Color(0xFFdbfeef),
                  Color(0xFFd7fdf6),
                  Color(0xFFd6fbfc),
                  Color(0xFFd7f8ff),
                  Color(0xFFdbf5ff),
                  Color(0xFFe1f2ff),
                  Color(0xFFe6efff),
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter
            )
        ),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/empty_box.png'), width: 200, height: 200),
            const Text('Ваша корзина пуста.', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Text('Чтобы совершить покупку, вам нужно сначала добавить товар в корзину.', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
                  textAlign: TextAlign.center),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
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
                    fontSize: 16
                ))),

          ],
        )
    );
  }
}
