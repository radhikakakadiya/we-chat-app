import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wechat/firebase/firebaseToapp.dart';
import 'package:wechat/pages/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyA6Yh8uW_iEL4vdA4o1lh9gGRfN8T-4pr0',
          appId: "1:249387409936:android:dec8737136552f3fdaa095",
          messagingSenderId: "249387409936",
          projectId: "wechat-e1446"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FirebaseToApp(),
    );
  }
}
