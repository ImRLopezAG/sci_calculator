import 'package:flutter/material.dart';
import 'package:sci_calculator/src/src.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Sci Calculator",
        home: const HomeScreen(),
        theme: AppTheme.darkTheme);
  }
}
