import 'package:flutter/material.dart';
import 'shopping_cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Store',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1F5FE0),
        scaffoldBackgroundColor: const Color(0xFFF1F2F5),
      ),
      home: const ShoppingCartPage(),
    );
  }
}