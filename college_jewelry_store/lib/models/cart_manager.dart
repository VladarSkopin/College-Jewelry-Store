
import 'package:college_jewelry_store/models/users_model.dart';
import 'package:flutter/material.dart';

class CartManager extends ChangeNotifier {

  // Тип ювелирного изделия

  String _type = 'any';

  String get type => _type;

  set type(String typeName) {
    _type = typeName;
    notifyListeners();
  }


  // Материал ювелирного изделия

  String _metal = 'any';

  String get metal => _metal;

  set metal(String metalName) {
    _metal = metalName;
    notifyListeners();
  }

  // Инкрустация ювелирного изделия

  String _gem = 'any';

  String get gem => _gem;

  set gem(String gemName) {
    _gem = gemName;
    notifyListeners();
  }

  String _currentUserLogin = 'admin';

  String get currentUserLogin => _currentUserLogin;

  set currentUserLogin(String login) {
    _currentUserLogin = login;
    notifyListeners();
  }


}