import 'package:app02/pages/home_page.dart';
import 'package:flutter/material.dart';

//stl tab
class MyApp extends StatelessWidget {
  
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      home: MyWidgetHomePage()
    );
  }
}