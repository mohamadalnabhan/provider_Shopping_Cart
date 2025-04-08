import 'package:flutter/material.dart';
import 'package:shopping_cart_provider/models/products.dart';
import 'products.dart';
class Cart with ChangeNotifier {
  List <Products> _prod = [];
  double _price = 0.0 ;

  void addProd (Products prod){
      _prod.add(prod);
    _price += prod.price;
    notifyListeners();
  }
  int get prodCount{
    return _prod.length ;
  }
  double get totalPrice{
    return _price ;
  }
}