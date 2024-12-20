import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop_app/components/shoe_tile.dart';
import 'package:sneaker_shop_app/models/cart.dart';
import 'package:sneaker_shop_app/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text(
                'Adicionado ao carrinho!',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: Text("Verifique seus itens"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pesquisa',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                      Icon(Icons.search, color: Colors.grey)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text('perfeito para todas as ocasiões',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.grey[600])),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Mais Vendidos 🔥',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        )),
                    Text('Veja tudo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue))
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Shoe shoe = value.getShoeShop()[index];
                  return ShoeTile(
                    shoe: shoe,
                    onTap: () => addShoeToCart(shoe),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 50, right: 50),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
