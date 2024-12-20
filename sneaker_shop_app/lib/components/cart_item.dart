import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop_app/models/cart.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void RemoveCartItem() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 4),
              borderRadius: BorderRadius.circular(8)),
          child: Image.asset(
            widget.shoe.Imagepath,
          ),
        ),
        title: Text(
          widget.shoe.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$' + widget.shoe.price),
        trailing:
            IconButton(onPressed: RemoveCartItem, icon: Icon(Icons.delete)),
      ),
    );
  }
}
