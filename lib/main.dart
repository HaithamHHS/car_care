import 'package:car_care/sign-up.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarCare',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE6ECF0),
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Login(),
        'sign-up':(context) => Signup(),
      },
    );
  }
}
