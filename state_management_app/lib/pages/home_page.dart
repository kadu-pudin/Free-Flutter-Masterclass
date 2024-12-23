import 'package:flutter/material.dart';
import 'package:minimal_shop_app/components/my_drawer.dart';
import 'package:minimal_shop_app/components/my_product_tile.dart';
import 'package:minimal_shop_app/models/shop.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title:
              Text('Shop Page', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: Icon(Icons.shopping_cart_outlined),
            )
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text('Pick the one you like!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
