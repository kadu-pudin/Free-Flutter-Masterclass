import 'package:flutter/material.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/pages/home_page.dart';
import 'package:notes_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBase.initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => NoteDataBase(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
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
      theme: Provider.of<ThemeProvider>(context).themeData,
      themeMode: ThemeMode.system,
    );
  }
}
