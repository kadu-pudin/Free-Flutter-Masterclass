import 'package:flutter/material.dart';
import 'package:notes_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void toogleTheme() {
    setState(() {
      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        toolbarHeight: 80,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left,
              size: 48,
            )),
        title: Text('SETTINGS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
            ),
            borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Dark Mode',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Transform.scale(
              scale: .8,
              child: Switch(
                value: Provider.of<ThemeProvider>(context).isDarkMode,
                onChanged: (value) => toogleTheme(),
                activeTrackColor: Theme.of(context).colorScheme.inversePrimary,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
