

import 'package:college_jewelry_store/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../db/operation_history_database.dart';

class AdminOperationsHistoryPage extends StatefulWidget {
  const AdminOperationsHistoryPage({Key? key}) : super(key: key);

  @override
  State<AdminOperationsHistoryPage> createState() => _AdminOperationsHistoryPageState();
}

class _AdminOperationsHistoryPageState extends State<AdminOperationsHistoryPage> {

  late List<TransactionInfo> transactionList;
  bool isLoading = false;

  final _tileTxtStyle = const TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  @override
  void initState() {
    super.initState();
    refreshTransactionList();
  }

  Future refreshTransactionList() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    this.transactionList = await OperationHistoryDatabase.instance.readAllTransactions();

    setState(() {
      isLoading = false;
    });
  }

/*  List<TransactionInfo> getSortedTransactionsByDate(List<TransactionInfo> transactionList) {
    return transactionList.sort((a, b) => a.transactionDateMillis.compareTo(b.transactionDateMillis));
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
        appBar: AppBar(title: const Text('ИСТОРИЯ ОПЕРАЦИЙ', style: TextStyle(
            fontSize: 16)),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
                    Icon(Icons.sort),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Сортировать по дате", style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: const [
                    Icon(Icons.sort),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Сортировать по цене", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Row(
                  children: const [
                    Icon(Icons.sort),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Сортировать по логину", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              PopupMenuItem(
                value: 4,
                child: Row(
                  children: const [
                    Icon(Icons.sort),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Сортировать по названию", style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ],
            offset: const Offset(0, 50),
            color: const Color(0xFF4A93FF),
            elevation: 2,
            onSelected: (value) {
              if (value == 1) {

                // SORT BY DATE
                setState(() {
                  transactionList.sort((a, b) => b.transactionDateMillis.compareTo(a.transactionDateMillis));
                });
              } else if (value == 2) {

                // SORT BY PRICE
                 setState(() {
                   transactionList.sort((a, b) => b.itemPrice.compareTo(a.itemPrice));
                 });

              } else if (value == 3) {

                // SORT BY LOGIN
                setState(() {
                  transactionList.sort((a, b) => a.login.compareTo(b.login));
                });

              } else if (value == 4) {

                // SORT BY LABEL
                setState(() {
                  transactionList.sort((a, b) => a.itemLabel.compareTo(b.itemLabel));
                });

              }
            },
          ),
        ]),
          body: isLoading ? const ColoredBox(
            color: Color(0xFFe3ffe8),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
                backgroundColor: Colors.white,
                strokeWidth: 8,
              ),
            ),
          ) : transactionList.isNotEmpty ? Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF19261b),
                    Color(0xFF1a251a),
                    Color(0xFF1b2419),
                    Color(0xFF1b2318),
                    Color(0xFF1c2217),
                    Color(0xFF1c2117),
                    Color(0xFF1d2016),
                    Color(0xFF1d1f16),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
            ),
            child: ListView.builder(
                itemCount: transactionList.length,
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, int index) {
                  final dateTime = DateTime.fromMillisecondsSinceEpoch(transactionList[index].transactionDateMillis);
                  String dateTimeString = DateFormat('d-MM-yyyy HH:mm:ss').format(dateTime);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
                    child: ExpansionTile(
                        backgroundColor: const Color(0xFFFFF5B0),
                        collapsedBackgroundColor: Colors.white,
                        textColor: Colors.black,
                        //collapsedTextColor: Colors.black,
                        iconColor: Colors.purpleAccent,
                        collapsedIconColor: Colors.purple,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text('Покупка: $dateTimeString', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                        childrenPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.centerLeft,
                        children: [
                          RichText(text: TextSpan(children: [
                            const TextSpan(text: 'login: ', style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            )),
                            TextSpan(text: transactionList[index].login, style: _tileTxtStyle)
                          ])),
                          const SizedBox(height: 20),
                          RichText(text: TextSpan(children: [
                            const TextSpan(text: 'itemLabel: ', style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            )),
                            TextSpan(text: transactionList[index].itemLabel, style: _tileTxtStyle)
                          ])),
                          const SizedBox(height: 20),
                          RichText(text: TextSpan(children: [
                            const TextSpan(text: 'itemPrice: ', style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            )),
                            TextSpan(text: '${transactionList[index].itemPrice}', style: _tileTxtStyle)
                          ])),
                          const SizedBox(height: 10),
                        ]
                    ),
                  );
                }
            )
          ) :
          ColoredBox(
            color: const Color(0xFFe3ffe8),
            child: RefreshIndicator(
              onRefresh: () async {
                refreshTransactionList();
              },
              color: Colors.white,
              backgroundColor: const Color(0xFF9C2C77),
              strokeWidth: 4,
              edgeOffset: 10,
              displacement: 80.0,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 2 - 200),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                    child: Text(
                        'База данных истории операций пуста. \n\nВозможно требуется обновить страницу',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: MaterialButton(
                        onPressed: () {
                          refreshTransactionList();
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
                  )
                ],
              ),
            ),
          )
    ));
  }
}
