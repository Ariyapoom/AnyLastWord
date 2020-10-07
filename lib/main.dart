import 'package:anylastword/presentation/home.dart';
import 'package:anylastword/route/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        AppRoutes.home : (context) => Homepage()
      },
    );
  }
}

