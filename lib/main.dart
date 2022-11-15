import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noted/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // initialise app
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
