import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Avocado", "4.00", "assets/images/avocado.png", Colors.green],
    ["Banana", "2.50", "assets/images/banana.png", Colors.amber],
    ["Chicken", "12.8", "assets/images/chicken.png", Colors.orange],
    ["Water", "1.00", "assets/images/water.png", Colors.blue],
  ];

  List _cartItems = [];

  get shopItems => _shopItems;

  //add items to cart
  get cartItems => _cartItems;
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  //remove items from cart

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  //calculate total price
  String totalPrice() {
    double total = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      total += double.parse(_cartItems[i][1]);
    }
    return total.toStringAsFixed(2);
  }
}
