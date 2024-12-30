import 'package:flutter/material.dart';
import 'package:minimal_shop_app/models/shop.dart';
import 'package:minimal_shop_app/pages/cart_page.dart';
import 'package:minimal_shop_app/pages/home_page.dart';
import 'package:minimal_shop_app/pages/intro_page.dart';
import 'package:minimal_shop_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/home_page': (context) => const HomePage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
