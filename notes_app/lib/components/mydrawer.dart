import 'package:flutter/material.dart';
import 'package:notes_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // header
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notes,
                    size: 48,
                  ),
                ],
              ),
            ),
            // notes
            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: Text('Notes',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold)),
              onTap: () => Navigator.pop(context),
            ),
            // settings
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              title: Text('Settings',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
