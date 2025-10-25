import 'package:flutter/material.dart';
import 'package:fruits_ecommerce_app/first_page.dart';
import 'package:fruits_ecommerce_app/provider.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoriteProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: firstpage(),
    );
  }
}
