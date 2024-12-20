import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/components/bottom_nav_bar.dart';
import 'package:sneaker_shop_app/pages/cart_page.dart';
import 'package:sneaker_shop_app/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
                    child: Image.asset(
                      'lib/images/logo.png',
                      color: Colors.grey[100],
                      height: 150,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.grey[100],
                    ),
                    title: Text(
                      'Loja',
                      style: TextStyle(
                          color: Colors.grey[100], fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.grey[100],
                    ),
                    title: Text(
                      'Sobre',
                      style: TextStyle(
                          color: Colors.grey[100], fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.grey[100],
                  ),
                  title: Text(
                    'Sair',
                    style: TextStyle(
                        color: Colors.grey[100], fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          MyBottomNavBar(onTabChange: (index) => navigateBottomBar(index)),
      body: _pages[_selectedIndex],
    );
  }
}
