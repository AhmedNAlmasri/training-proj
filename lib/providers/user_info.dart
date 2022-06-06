import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'dart:io';


class UserFood with ChangeNotifier {
  var _recipes = ['Burger', 'Pasta', "Koshari", "Pancake", "Waffles"];

  int _providerNum=1;
  int get providerNum=>_providerNum;
  List<String> get recipes => _recipes;

  void changeValue() {
    if(_providerNum<=3)
    _providerNum++;
    else
      _providerNum=0;

    notifyListeners();
  }void resetValue() {
    _providerNum=0;
    notifyListeners();
  }

  void add(String newRecipe){
    _recipes.insert(0, newRecipe);
  }
}
