
import 'package:college_jewelry_store/db/cart_database.dart';
import 'package:flutter/material.dart';
import '../models/catalog_model.dart';
import 'package:intl/intl.dart' as intl;


class ItemPageCart extends StatefulWidget {
  const ItemPageCart({Key? key, required this.item}) : super(key: key);

  final Jewelry item;


  @override
  State<ItemPageCart> createState() => _ItemPageCartState();
}

class _ItemPageCartState extends State<ItemPageCart> {


  var formatter = intl.NumberFormat('#,###');

  final _txtStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      shadows: [
        Shadow(
            color: Colors.grey[600]!,
            blurRadius: 2.0,
            offset: const Offset(1, 1)
        )
      ]
  );

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('ВЫБОР ИЗДЕЛИЯ'), centerTitle: true),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFab7474),
                    Color(0xFFab747d),
                    Color(0xFFa97586),
                    Color(0xFFa5778e),
                    Color(0xFFa07996),
                    Color(0xFF997c9d),
                    Color(0xFF907fa3),
                    Color(0xFF8782a8),
                  ],
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.height / 2.2,
                    height: MediaQuery.of(context).size.height / 2.2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage(widget.item.imgUrl),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(widget.item.label, style: _txtStyle),
                Text(
                  //'Цена: ${widget.item.price} руб.',
                  'Цена: ${formatter.format(widget.item.price)} руб.'.replaceAll(',', ' '),
                  //'Цена: ${formatter.format(widget.item.price)} руб.',
                  style: _txtStyle.copyWith(
                      fontSize: 18
                  ),
                ),
                Text('Товар уже находится в корзине', style: _txtStyle, textAlign: TextAlign.center),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}