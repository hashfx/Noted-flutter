import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:noted/pages/home_page.dart';

void main() async {
  // initialise all widgets
  WidgetsFlutterBinding.ensureInitialized();

  // check if current platform is web
  if (kIsWeb) {
    // initialise Firebase for IOS, Android
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBdJ5MbODcHtYZP0A-yRi4RtpvVQSNv11I",
            authDomain: "noted-flutter.firebaseapp.com",
            projectId: "noted-flutter",
            storageBucket: "noted-flutter.appspot.com",
            messagingSenderId: "803102434031",
            appId: "1:803102434031:web:32d18ec6bd25661078711a"));
  } else {
    // initialise Firebase for Web
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
