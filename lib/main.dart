import 'package:flutter/material.dart';
import 'package:zbon/widget/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Color(0xFFDFCACA),
          ),
          backgroundColor: Color(0xFFDFCACA)
        )
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}