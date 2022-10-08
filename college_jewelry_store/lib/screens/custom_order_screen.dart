
import 'package:college_jewelry_store/models/cart_manager.dart';
import 'package:college_jewelry_store/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'item_page.dart';
import 'package:intl/intl.dart' as intl;


class CustomOrderScreen extends StatefulWidget {
  const CustomOrderScreen({Key? key}) : super(key: key);

  @override
  State<CustomOrderScreen> createState() => _CustomOrderScreenState();
}

class _CustomOrderScreenState extends State<CustomOrderScreen> {

  final List<Jewelry> _bufferItemList = CatalogModel.jewelryItems;
  late List<Jewelry> _customItemList;

  String? _type = 'Любой';
  String? _metal = 'Любой';
  String? _gem = 'Любая';

  final _txtStyle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600
  );

  var formatter = intl.NumberFormat('#,###');
  

  @override
  void initState() {
    _customItemList = _bufferItemList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartManager(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: const Text('ВЫБОР ИЗДЕЛИЯ'), centerTitle: true),
          body: Consumer<CartManager>(
            builder: (context, model, _) {
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
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                                child: Text('Тип:', style: _txtStyle),
                              ),
                              DropdownButton<String>(
                                  value: _type,
                                  items: <String>['Любой', 'Кольца', 'Браслеты', 'Брошки', 'Ожерелья', 'Серёжки']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? val) {

                                    setState(() {
                                      _type = val;
                                    });

                                    Provider.of<CartManager>(context, listen: false).type =
                                    (val == 'Кольца') ? 'ring'
                                        : (val == 'Браслеты') ? 'bracelet'
                                        : (val == 'Брошки') ? 'brooch'
                                        : (val == 'Ожерелья') ? 'necklace'
                                        : (val == 'Серёжки') ? 'earring'
                                        : 'any';


                                    String chosenType = Provider.of<CartManager>(context, listen: false).type;
                                    String chosenMetal = Provider.of<CartManager>(context, listen: false).metal;
                                    String chosenGem = Provider.of<CartManager>(context, listen: false).gem;

                                    setState(() {
                                      if (chosenType == 'any' && chosenMetal == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList;
                                      } else if (chosenType == 'any' && chosenMetal == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenType == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.metal == chosenMetal
                                        )).toList();
                                      } else if (chosenMetal == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType
                                        )).toList();
                                      } else if (chosenType == 'any'){
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.metal == chosenMetal &&
                                                element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenMetal == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.metal == chosenMetal
                                        )).toList();
                                      } else {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.metal == chosenMetal &&
                                                element.gem == chosenGem
                                        )).toList();
                                      }

                                    });

                                  }
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                                child: Text('Металл:', style: _txtStyle),
                              ),
                              DropdownButton<String>(
                                  value: _metal,
                                  items: <String>['Любой', 'Серебро', 'Золото', 'Платина']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? val) {

                                    setState(() {
                                      _metal = val;
                                    });

                                    Provider.of<CartManager>(context, listen: false).metal =
                                    (val == 'Серебро') ? 'silver'
                                        : (val == 'Золото') ? 'gold'
                                        : (val == 'Платина') ? 'platinum'
                                        : 'any';


                                    String chosenType = Provider.of<CartManager>(context, listen: false).type;
                                    String chosenMetal = Provider.of<CartManager>(context, listen: false).metal;
                                    String chosenGem = Provider.of<CartManager>(context, listen: false).gem;

                                    setState(() {
                                      if (chosenType == 'any' && chosenMetal == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList;
                                      } else if (chosenType == 'any' && chosenMetal == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                                element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenType == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                                element.metal == chosenMetal
                                        )).toList();
                                      } else if (chosenMetal == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType
                                        )).toList();
                                      } else if (chosenType == 'any'){
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                                element.metal == chosenMetal &&
                                                element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenMetal == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.metal == chosenMetal
                                        )).toList();
                                      } else {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.metal == chosenMetal &&
                                                element.gem == chosenGem
                                        )).toList();
                                      }

                                    });


                                  }
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                                child: Text('Инкрустация:', style: _txtStyle),
                              ),
                              DropdownButton<String>(
                                  value: _gem,
                                  items: <String>['Любая', 'Аметист', 'Бриллиант', 'Рубин', 'Изумруд', 'Сапфир', 'Нет']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? val) {

                                    setState(() {
                                      _gem = val;
                                    });

                                    Provider.of<CartManager>(context, listen: false).gem =
                                    (val == 'Аметист') ? 'amethyst'
                                        : (val == 'Бриллиант') ? 'diamond'
                                        : (val == 'Рубин') ? 'ruby'
                                        : (val == 'Изумруд') ? 'emerald'
                                        : (val == 'Сапфир') ? 'sapphire'
                                        : (val == 'Нет') ? 'none'
                                        : 'any';


                                    String chosenType = Provider.of<CartManager>(context, listen: false).type;
                                    String chosenMetal = Provider.of<CartManager>(context, listen: false).metal;
                                    String chosenGem = Provider.of<CartManager>(context, listen: false).gem;

                                    setState(() {
                                      if (chosenType == 'any' && chosenMetal == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList;
                                      } else if (chosenType == 'any' && chosenMetal == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenType == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.metal == chosenMetal
                                        )).toList();
                                      } else if (chosenMetal == 'any' && chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType
                                        )).toList();
                                      } else if (chosenType == 'any'){
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.metal == chosenMetal &&
                                                element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenMetal == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.gem == chosenGem
                                        )).toList();
                                      } else if (chosenGem == 'any') {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.metal == chosenMetal
                                        )).toList();
                                      } else {
                                        _customItemList = _bufferItemList
                                            .where((element) => (
                                            element.type == chosenType &&
                                                element.metal == chosenMetal &&
                                                element.gem == chosenGem
                                        )).toList();
                                      }

                                    });

                                  }
                              ),
                            ],
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Column(
                                children: const [
                                  Image(
                                    image: AssetImage('assets/playstore.png'),
                                    width: 80,
                                    height: 80,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'В результате указанных вами опций внизу появится отфильтрованный список ювелирных изделий',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 16,
                                        height: 1.6
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  /*
                                  Text(
                                  '${Provider.of<CartManager>(context, listen: false).type} ${Provider.of<CartManager>(context, listen: false).metal} ${Provider.of<CartManager>(context, listen: false).gem}'
                                  )
                                  */
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),

                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _customItemList.length,
                            itemBuilder: (context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 10),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image(
                                                image: AssetImage(_customItemList[index].imgUrl),
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
                                                            child: ItemPage(item: _customItemList[index],)
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
                                    const SizedBox(height: 10),
                                    Text(
                                      '${formatter.format(_customItemList[index].price)} руб.',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 14,
                                          shadows: [
                                            Shadow(
                                                color: Colors.grey[300]!,
                                                blurRadius: 2.0,
                                                offset: const Offset(1, 1)
                                            )
                                          ]
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
