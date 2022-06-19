import 'package:flutter/material.dart';
import 'package:notepad_app/src/presentation/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notepad_app/src/utils/get_it_setup.dart';
import 'package:notepad_app/src/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getItSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: const LoginScreen(),
    );
  }
}
