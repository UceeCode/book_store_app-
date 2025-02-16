import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> book) {
    _cartItems.add(book);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> book) {
    _cartItems.remove(book);
    notifyListeners();
  }

  void incrementQuantity(Map<String, dynamic> item) {
    int index = cartItems.indexOf(item);
    if (index != -1) {
      cartItems[index]['quantity'] = (cartItems[index]['quantity'] ?? 1) + 1;
      notifyListeners();
    }
  }

  void decrementQuantity(Map<String, dynamic> item) {
    int index = cartItems.indexOf(item);
    if (index != -1) {
      int currentQuantity = cartItems[index]['quantity'] ?? 1;
      if (currentQuantity > 0) { // Changed condition here
        cartItems[index]['quantity'] = currentQuantity - 1;
        notifyListeners();
      }
      // Do NOT remove the item when it reaches zero.
    }
  }
}