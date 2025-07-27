import 'package:figma_login/firebase_options.dart';
import 'package:figma_login/login.dart';
import 'package:figma_login/reels/reels_view.dart';
import 'package:figma_login/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,  
      home:Login() ,
    );
  }
}