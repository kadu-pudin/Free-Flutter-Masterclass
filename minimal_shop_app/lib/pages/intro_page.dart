import 'package:flutter/material.dart';
import 'package:minimal_shop_app/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 84,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 24,
            ),

            // name app
            Text(
              'kadu\'s shop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),

            // description
            Text(
              'premium quality products',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            SizedBox(
              height: 25,
            ),

            // button
            MyButton(
                child: Icon(Icons.arrow_forward),
                onTap: () => Navigator.pushNamed(context, '/home_page'))
          ],
        ),
      ),
    );
  }
}
