import 'package:flutter/material.dart';
import 'package:minimal_shop_app/components/my_button.dart';
import 'package:minimal_shop_app/models/products.dart';
import 'package:minimal_shop_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: Text('Remove this from your cart?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text('Sure',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: Text('DONE!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text('Cart Page', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
              child: cart.isEmpty
                  ? Center(
                      child: Text('Your cart is empty',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary)),
                    )
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return ListTile(
                          leading: Icon(item.icon),
                          title: Text(item.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(item.price.toString(),
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary)),
                          trailing: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () => removeItemFromCart(context, item),
                          ),
                        );
                      },
                    )),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MyButton(
                child: Text('Pay Now'),
                onTap: () {
                  payButtonPressed(context);
                }),
          ),
        ],
      ),
    );
  }
}
