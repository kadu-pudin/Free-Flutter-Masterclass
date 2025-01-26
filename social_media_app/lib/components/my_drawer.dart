import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/pages/profile_page.dart';
import 'package:social_media_app/pages/users_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: LinearBorder(),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Text('🐵social',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2,
                        fontSize: 50,
                      )),
                ),
                ListTile(
                  leading: Icon(Icons.home,
                      color: Theme.of(context).colorScheme.tertiary),
                  title: Text(
                    'I N Í C I O',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: Icon(Icons.person,
                      color: Theme.of(context).colorScheme.tertiary),
                  title: Text(
                    'P E R F I L',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.people,
                      color: Theme.of(context).colorScheme.tertiary),
                  title: Text('U S U Á R I O S',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary)),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersPage(),
                        ));
                  },
                )
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.tertiary),
              title: Text('S A I R',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
              onTap: () => FirebaseAuth.instance.signOut(),
            )
          ],
        ),
      ),
    );
  }
}
