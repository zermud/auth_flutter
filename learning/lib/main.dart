import 'package:flutter/material.dart';
import 'app/widgets/splash.dart';
import 'app/widgets/auth/login.dart';
import 'app/widgets/auth/forgot.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return MaterialApp(home: LoginScreen());
        }
      }
    );
    // return MaterialApp(home: ForgotScreen());
  }
}
