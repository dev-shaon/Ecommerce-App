import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/first_page.dart';

void main(){
  runApp(FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fruits App",
      home: firstpage(),
    );
  }
}
