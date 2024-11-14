import 'package:flutter/material.dart';
import 'package:lab1/pages/chatapp/loginpage.dart';
import 'package:lab1/pages/dashboard.dart';
import 'package:lab1/pages/dashboardpage.dart';
import 'package:lab1/pages/loginpage.dart';
import 'package:lab1/pages/mapclass.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab1/pages/webview/webviewlab.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Webviewlab(),
    );
  }
}

