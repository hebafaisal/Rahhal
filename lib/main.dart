import 'package:flutter/material.dart';
import 'package:flutter_application_rahhal/FinancialManagement.dart';
import 'package:flutter_application_rahhal/Home.dart';
import 'package:flutter_application_rahhal/SignIn.dart';
import 'package:flutter_application_rahhal/StartUp.dart';
import 'package:flutter_application_rahhal/Trip.dart';
import 'package:flutter_application_rahhal/profile.dart';
import 'package:flutter_application_rahhal/signUp.dart';

void main() {
  runApp(Rahaal());
}

class Rahaal extends StatelessWidget {
  const Rahaal({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => StartUp(),
        '/signin': (context) => SignIn(),
        '/SignUp': (context) => SignUp(),
        '/home': (context) => HomePage(),
        '/Trip': (context) => Trip(),
        '/funicael': (context) => FinancialManagement(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}