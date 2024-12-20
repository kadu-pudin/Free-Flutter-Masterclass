import 'package:flutter/material.dart';
import 'package:sneaker_shop_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 30),
              child: Image.asset('lib/images/logo.png',
                  height: 180, color: Colors.grey[900]),
            ),
            Text(
              'Nada é Impossível',
              style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'A gente tá sempre lá para quem cria.'
              ' Para melhorar performances. Fazer diferente.'
              ' Lembrando sempre do nosso impacto no planeta.',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage())),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Comprar agora',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[100]),
                    ),
                    Icon(Icons.keyboard_arrow_right_outlined,
                        color: Colors.grey[100]),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
