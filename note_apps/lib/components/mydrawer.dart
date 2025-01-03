import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_apps/pages/settings_page.dart';

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
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 32,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Notes App',
                      style: GoogleFonts.dmSerifText(
                          fontWeight: FontWeight.bold, fontSize: 32)),
                ],
              ),
            ),
            // notes
            ListTile(
              leading: Icon(Icons.home),
              title:
                  Text('Notes', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () => Navigator.pop(context),
            ),
            // settings
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
              },
            )
          ],
        ),
      ),
    );
  }
}
