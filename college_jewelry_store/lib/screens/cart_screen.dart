
import 'package:flutter/material.dart';


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
            SizedBox(height: 50),
            Text('Ваша корзина пуста.', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            )),
            SizedBox(height: 50),
            Text('Чтобы совершить покупку, вам нужно сначала добавить товар в корзину.', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,),
          ],
        )
    );
  }
}
