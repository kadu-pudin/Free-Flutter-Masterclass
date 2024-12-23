import 'package:flutter/material.dart';
import 'package:minimal_shop_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: LinearBorder(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                SizedBox(
                    height: 180,
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag,
                        size: 76,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    )),
                // shop tile
                MyListTile(
                  icon: Icons.home,
                  title: 'Shop',
                  onTap: () => Navigator.pop(context),
                ),

                // cart tile
                MyListTile(
                  icon: Icons.shopping_cart,
                  title: 'Cart',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/cart_page');
                  },
                ),
              ],
            ),
            // exit
            MyListTile(
              icon: Icons.logout,
              title: 'Exit',
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ],
        ),
      ),
    );
  }
}
