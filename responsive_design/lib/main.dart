import 'package:flutter/material.dart';
import 'package:responsive_design/responsive/desktop_scaffold.dart';
import 'package:responsive_design/responsive/mobile_scaffold.dart';
import 'package:responsive_design/responsive/responsive_layout.dart';
import 'package:responsive_design/responsive/tablet_scaffold.dart';
import 'package:responsive_design/themes/dark_mode.dart';
import 'package:responsive_design/themes/light_mode.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        desktopScaffold: const DesktopScaffold(),
        mobileScaffold: const MobileScaffold(),
        tabletScaffold: const TabletScaffold(),
      ),
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
    );
  }
}
