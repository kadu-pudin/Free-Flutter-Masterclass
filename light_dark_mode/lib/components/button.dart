import 'package:flutter/material.dart';
import 'package:light_dark_mode/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  const MyButton({super.key, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(25),
        child: Center(
          child: Icon(Provider.of<ThemeProvider>(context).themeData == darkMode
              ? Icons.sunny
              : Icons.mode_night),
        ),
      ),
    );
  }
}
