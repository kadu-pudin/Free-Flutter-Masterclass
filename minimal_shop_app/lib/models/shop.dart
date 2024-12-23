import 'package:flutter/material.dart';
import 'package:minimal_shop_app/models/products.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
        name: 'Phone Icon',
        price: 1099.99,
        description: 'Pretty good product',
        icon: Icons.phone),
    Product(
        name: 'Laptop Icon',
        price: 99.99,
        description: 'Pretty good product',
        icon: Icons.laptop),
    Product(
        name: 'Apple Icon',
        price: 999.99,
        description: 'Pretty good apple',
        icon: Icons.apple)
  ];
  // user cart
  final List<Product> _cart = [];
  // get products list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;
  // add to the cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove from the cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
