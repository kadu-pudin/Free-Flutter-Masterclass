import 'package:flutter/material.dart';
import 'package:note_apps/models/note_database.dart';
import 'package:note_apps/pages/home_page.dart';
import 'package:note_apps/themes/light_mode.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBase.initialize();
  runApp(ChangeNotifierProvider(
    create: (context) => NoteDataBase(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: lightMode,
      themeMode: ThemeMode.light,
    );
  }
}
