import 'package:flutter/material.dart';
import 'package:flutter_iyzico/screen/payment_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Iyzico demo',
      home: PaymentScreen()
    );
  }
}