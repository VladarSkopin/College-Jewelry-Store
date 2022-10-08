
import 'package:flutter/material.dart';
import '../models/catalog_model.dart';
import 'package:intl/intl.dart' as intl;


class ItemPage extends StatefulWidget {
  const ItemPage({Key? key, required this.item}) : super(key: key);

  final Jewelry item;


  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {


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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: AssetImage(widget.item.imgUrl),
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
                SizedBox(
                  width: 300,
                  height: 60,
                  child: MaterialButton(
                    onPressed: () {

                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Товар успешно добавлен в корзину', style: TextStyle(
                              color: Color(0xFF256D85),
                              fontSize: 24
                            ), textAlign: TextAlign.center),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            backgroundColor: const Color(0xFFDFF6FF),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Ок', style: TextStyle(
                                  color: Color(0xFF47B5FF),
                                  fontSize: 28
                                )),
                              ),
                            ],
                          )
                      );

                    },
                    color: const Color(0xFF256D85),
                    shape: const StadiumBorder(
                      side: BorderSide(
                        color: Colors.grey
                      )
                    ),
                    elevation: 6.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(
                            Icons.shopping_cart_outlined,
                            color: Color(0xFFDFF6FF),
                            size: 28
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 1,
                          width: 1,
                        ),
                        Text(
                          'ДОБАВИТЬ В КОРЗИНУ',
                          style: TextStyle(
                            color: Color(0xFFDFF6FF),
                          fontSize: 16,
                            fontWeight: FontWeight.w600
                        )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
