import 'package:college_jewelry_store/db/cart_database.dart';
import 'package:college_jewelry_store/db/operation_history_database.dart';
import 'package:college_jewelry_store/db/users_database.dart';
import 'package:college_jewelry_store/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/catalog_model.dart';
import 'custom_order_screen.dart';
import 'package:intl/intl.dart' as intl;
import 'item_page_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Jewelry> jewelryList;
  bool isLoading = false;

  var formatter = intl.NumberFormat('#,###');

  final _txtDescriptionStyle = TextStyle(
      color: Colors.blueAccent,
      fontSize: 14,
      height: 1.6,
      shadows: [
        Shadow(
            color: Colors.grey[300]!,
            blurRadius: 2.0,
            offset: const Offset(1, 1))
      ]);

  final _deleteBtnText = const Text('убрать', style: TextStyle(
      color: Colors.white
  ));

  String login = 'admin';
  String currentUserName = 'Пользователь';

  @override
  void initState() {
    super.initState();
    loadCurrentUserLogin();
    refreshCart();
  }

  @override
  void dispose() {
    //CartDatabase.instance.close(); // Unhandled Exception -> database closed !
    super.dispose();
  }

  Future loadCurrentUserLogin() async {
    await Future.delayed(const Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      login = prefs.getString('login') ?? 'admin';
    });
  }

  Future refreshCart() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    this.jewelryList = await CartDatabase.instance.readAllJewelry();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xFFe3ffe8),
          Color(0xFFdbfeef),
          Color(0xFFd7fdf6),
          Color(0xFFd6fbfc),
          Color(0xFFd7f8ff),
          Color(0xFFdbf5ff),
          Color(0xFFe1f2ff),
          Color(0xFFe6efff),
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                  backgroundColor: Colors.lightBlueAccent,
                  strokeWidth: 8,
                ),
              )
            : jewelryList.isEmpty
                ? buildEmptyCartPage()
                : buildReadyCartPage());
  }

  Widget buildEmptyCartPage() {
    return Center(
      child: RefreshIndicator(
        onRefresh: () async {
          refreshCart();
        },
        color: Colors.white,
        backgroundColor: const Color(0xFF9C2C77),
        strokeWidth: 4,
        edgeOffset: 10,
        displacement: 80.0,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: ListView(
          children: [Column(
            children: [
              const Image(
                  image: AssetImage('assets/empty_box.png'), width: 180, height: 180),
              const Text('Ваша корзина пуста.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  )),
              const SizedBox(height: 16),
              MaterialButton(
                  onPressed: () {
                    refreshCart();
                  },
                  color: Colors.lightBlueAccent,
                  shape: const StadiumBorder(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                          Icons.refresh,
                          color: Color(0xFFDFF6FF),
                          size: 28
                      ),
                      SizedBox(width: 10),
                      Text(
                          'Обновить',
                          style: TextStyle(
                              color: Color(0xFFDFF6FF),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          )),
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Text(
                    'Чтобы совершить покупку, вам нужно сначала добавить товар в корзину.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(height: 10),
              MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 800),
                            child: const CustomOrderScreen()));
                  },
                  color: const Color(0xFF256D85),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  elevation: 6.0,
                  shape:
                      const StadiumBorder(side: BorderSide(color: Color(0xFF4A93FF))),
                  child: const Text('ПОИСК ИЗДЕЛИЙ',
                      style: TextStyle(color: Colors.white, fontSize: 16))),

            ],
          ),
        ]
        ),
      ),
    );
  }

  Widget buildReadyCartPage() {
    int totalPrice = jewelryList.fold(0, (sum, next) => sum + next.price);
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text('Ваши товары:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                    //shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: jewelryList.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Column(
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(jewelryList[index].imgUrl),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageTransition(
                                                  type: PageTransitionType.scale,
                                                  alignment: Alignment.bottomCenter,
                                                  duration: const Duration(milliseconds: 1200),
                                                  child: ItemPageCart(item: jewelryList[index])
                                              )
                                          );
                                        },
                                        splashColor: Colors.lightBlueAccent.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  )
                                ]
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                jewelryList[index].label,
                                style: _txtDescriptionStyle,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            //const SizedBox(height: 10),
                            Text(
                              '${formatter.format(jewelryList[index].price)} руб.',
                              style: _txtDescriptionStyle,
                              textAlign: TextAlign.center,
                            ),
                            MaterialButton(
                              onPressed: () async {
                                await CartDatabase.instance
                                    .delete(jewelryList[index].id!);
                                refreshCart();
                              },
                                color: const Color(0xFF9C2C77),
                                //color: Color(0xFFAF0171),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              child: _deleteBtnText
                            )
                          ],
                        ),
                      );
                    }),
          ),
          const SizedBox(height: 20),
          Text('Всего: ${formatter.format(totalPrice)} руб.'.replaceAll(',', ' '), style: TextStyle(
            fontSize: 20,
              shadows: [
                Shadow(
                    color: Colors.grey[300]!,
                    blurRadius: 2.0,
                    offset: const Offset(1, 1))
              ]
          )),
          const SizedBox(height: 30),
          MaterialButton(
              onPressed: () async {

                // ADD DATA TO OPERATIONS HISTORY
                int dateTimeMillis = DateTime.now().millisecondsSinceEpoch;
                for (Jewelry jewelry in jewelryList) {
                  TransactionInfo ti = TransactionInfo(login: login, itemLabel: jewelry.label, itemPrice: jewelry.price, transactionDateMillis: dateTimeMillis);
                  await OperationHistoryDatabase.instance.writeTransactionInfo(ti);
                }

                await CartDatabase.instance.deleteAll();

                currentUserName = await UsersDatabase.instance.getUserName(login);

                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                          'Спасибо за покупку, $currentUserName!',
                          style: const TextStyle(
                              color: Color(0xFF256D85), fontSize: 24),
                          textAlign: TextAlign.center),
                      content: const Text('\nЗаберите ваши товары в нашей мастерской по адресу: РФ, г.Санкт-Петербург, пр.Энгельса, д.23 (ИСПО)',
                        style: TextStyle(
                            color: Color(0xFF256D85), fontSize: 20)),
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

                refreshCart();
              },
              color: const Color(0xFF256D85),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              elevation: 6.0,
              shape:
              const StadiumBorder(side: BorderSide(color: Color(0xFF4A93FF))),
              child: const Text('КУПИТЬ',
                  style: TextStyle(color: Colors.white, fontSize: 22))),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
