import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? type;
  const MyListTile(
      {super.key, required this.title, required this.subtitle, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).colorScheme.secondary),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: type == 'post'
            ? Icon(
                Icons.notes,
                size: 20,
              )
            : Icon(
                Icons.person,
                size: 20,
              ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
                fontSize: 12)),
      ),
    );
  }
}
