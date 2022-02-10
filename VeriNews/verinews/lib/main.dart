//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:verinews/pages/results_page.dart';
import 'package:verinews/utils/colors.dart';
import 'package:verinews/widgets/web_screen_layout.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyB_CNpvlV-NMWj0bRVE7vaHU3BPEy6ovF4",
  //     appId: "1:877929623093:web:de318a5a94519134070b7c",
  //     messagingSenderId: "877929623093",
  //     projectId: "verinews-e244f",
  //     storageBucket: "verinews-e244f.appspot.com",
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VeriNews',
      theme: ThemeData.light().copyWith(primaryColor: primaryColor),
      home: WebScreenLayout(),
      //home: const WebScreenLayout(),
    );
  }
}

class HomePage {}
