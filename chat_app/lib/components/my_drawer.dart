import 'package:chat_app/services/authentication/auth_service.dart';
import 'package:chat_app/pages/about_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final String? currentUserEmail;
  const MyDrawer({
    super.key,
    required this.currentUserEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo
            Column(
              children: [
                Text(
                  'Conectado como $currentUserEmail',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  child: Text(
                    '🐵chat',
                    style: TextStyle(
                        fontSize: 50,
                        letterSpacing: -2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // home
                ListTile(
                  onTap: () => Navigator.pop(context),
                  leading: Icon(Icons.chat,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text('Conversas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                ),
                // about
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutPage(),
                        ));
                  },
                  leading: Icon(Icons.info,
                      color: Theme.of(context).colorScheme.primary),
                  title: Text('Sobre',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      )),
                ),
              ],
            ),
            // logout
            ListTile(
                onTap: () => AuthService().signOut(),
                leading: Icon(Icons.logout,
                    color: Theme.of(context).colorScheme.primary),
                title: Text('Sair',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ))),
          ],
        ),
      ),
    );
  }
}
