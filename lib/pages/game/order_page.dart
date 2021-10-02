import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/order';
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'YOUR ORDER',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.grey),
        ),
      ),
    );
  }
}