
final String tableOperationsHistory = 'tableOperationsHistory';

class TransactionFields {
  static final List<String> values = [
    id, login, itemLabel, itemPrice, transactionDateMillis
  ];

  static final String id = '_id';
  static final String login = 'login';
  static final String itemLabel = 'itemLabel';
  static final String itemPrice = 'itemPrice';
  static final String transactionDateMillis = 'transactionDateMillis';
}

class TransactionInfo {
  int? id;
  String login;
  String itemLabel;
  int itemPrice;
  //int transactionDateMillis = 1665692617;
  int transactionDateMillis = 1665692617;

  TransactionInfo({
   this.id,
   required this.login,
   required this.itemLabel,
   required this.itemPrice,
   required this.transactionDateMillis
  });

  Map<String, Object?> toJson() => {
    '_id' : id,
    'login' : login,
    'itemLabel' : itemLabel,
    'itemPrice' : itemPrice,
    'transactionDateMillis' : transactionDateMillis
  };

  static TransactionInfo fromJson(Map<String, Object?> json) => TransactionInfo(
    id: json['_id'] as int?,
    login: json['login'] as String,
    itemLabel: json['itemLabel'] as String,
    itemPrice: json['itemPrice'] as int,
    transactionDateMillis: json['transactionDateMillis'] as int
  );

  TransactionInfo copy({
    int? id,
    String? login,
    String? itemLabel,
    int? itemPrice,
    int? transactionDateMillis
  }) => TransactionInfo(
    id: id ?? this.id,
    login: login ?? this.login,
    itemLabel: itemLabel ?? this.itemLabel,
    itemPrice: itemPrice ?? this.itemPrice,
      transactionDateMillis: transactionDateMillis ?? this.transactionDateMillis
  );

}