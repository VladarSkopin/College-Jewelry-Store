
import 'package:college_jewelry_store/screens/item_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../models/catalog_model.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({Key? key}) : super(key: key);

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {

  final _silverList = CatalogModel.jewelryItems.where((element) => (element.metal == 'silver')).toList();
  final _goldenList = CatalogModel.jewelryItems.where((element) => (element.metal == 'gold')).toList();
  final _platinumList = CatalogModel.jewelryItems.where((element) => (element.metal == 'platinum')).toList();

  final _catalogDecoration = const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color(0xFFaab5be),
            Color(0xFFa3abb3),
            Color(0xFF9ba1a8),
            Color(0xFFa3abb3),
            Color(0xFFaab5be),
            Color(0xFFb1c0c9),
            Color(0xFFb8cad4),
          ],
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter
      )
  );


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
        appBar: AppBar(title: const Text('ЮВЕЛИРНАЯ МАСТЕРСКАЯ'), centerTitle: true),
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
            child:
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                    child: Text(
                      'В данной коллекции представлены образцы наших ювелирных изделий',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          shadows: [
                            Shadow(
                                color: Colors.lightBlueAccent,
                                blurRadius: 2.0,
                                offset: Offset(1, 1)
                            )
                          ]
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Серебро', style: _txtStyle),
                  ),
                  Container(
                    decoration: _catalogDecoration,
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _silverList.length,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(_silverList[index].imgUrl),
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
                                                child: ItemPage(item: _silverList[index],)
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
                          );
                        }),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Золото', style: _txtStyle),
                  ),
                  Container(
                    decoration: _catalogDecoration,
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _goldenList.length,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(_goldenList[index].imgUrl),
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
                                                  child: ItemPage(item: _goldenList[index],)
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
                          );
                        }),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text('Платина', style: _txtStyle),
                  ),
                  Container(
                    decoration: _catalogDecoration,
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: _platinumList.length,
                        itemBuilder: (context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image(
                                      image: AssetImage(_platinumList[index].imgUrl),
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
                                                  child: ItemPage(item: _platinumList[index],)
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
                          );
                        }),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
        ),
      ),
    );
  }
}
