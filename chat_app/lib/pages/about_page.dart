import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            size: 32,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            Text(
              'Esse aplicativo NÂO contém vírus e não tem acesso as mensagens '
              'individuais postadas pelos usuários (apenas para armazenamento...) '
              'ou as senhas utilizadas (infelizmente).'
              '\n\nAd proident fugiat nisi ipsum non. Labore quis voluptate veniam '
              'do veniam ut amet nisi irure irure. Sunt reprehenderit exercitation '
              'duis duis deserunt cupidatat et excepteur. 🤓'
              '\n\nUt consectetur ullamco incididunt magna sit velit do aute qui. '
              'Fugiat id sunt elit non id mollit occaecat consectetur mollit laboris dolore.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Produção',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            Text(
              'kadu pudin pereira',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
