import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final IconData icon;

  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.icon,
  });
}
