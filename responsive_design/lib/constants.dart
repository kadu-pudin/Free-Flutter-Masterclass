import 'package:flutter/material.dart';

var myDrawer = Drawer(
  shape: LinearBorder(),
  child: Padding(
    padding: const EdgeInsets.all(25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Icon(
                Icons.animation,
                size: 48,
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('D A S H B O A R D',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('M E S S A G I N G',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('S E T T I N G S',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('L O G O U T',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    ),
  ),
);
