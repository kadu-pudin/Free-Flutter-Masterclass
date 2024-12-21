import 'package:flutter/material.dart';
import 'package:todo_app/utilities/button2.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  State<CreditPage> createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {

  int _number_of_buttons = 1;

  void addAnotherButton() {
    setState(() {
      _number_of_buttons += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          'Sobre',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(10),
              child: Text(
                'Carlos Eduardo de Andrade, também '
                'conhecido como KADU, criou essa aplicação '
                'com a intenção de ajudar seus brothers.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _number_of_buttons,
                  itemBuilder: (context, index) {
                    return MyButton2(
                      onTap: () => addAnotherButton(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
