import 'package:flutter/material.dart';
import 'package:habit_tracker_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: LinearBorder(),
      child: Center(
        child: Switch(
          value: Provider.of<ThemeProvider>(context).isDarkMode,
          onChanged: (value) =>
              Provider.of<ThemeProvider>(context, listen: false).toogleTheme(),
        ),
      ),
    );
  }
}
