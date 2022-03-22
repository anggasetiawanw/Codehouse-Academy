import 'package:flutter/material.dart';
import 'package:tugas_minggu4/layout/sign_in.dart';
import 'package:tugas_minggu4/layout/splash_Screen.dart';

import 'layout/main_page/main_page.dart';
import 'layout/sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SignIn(),
        '/sign-in': (context) => const SignIn(),
        '/sign-up': (context) => const SignUp(),
        '/main-page': (context) => const MainPage(),
      },
    );
  }
}
