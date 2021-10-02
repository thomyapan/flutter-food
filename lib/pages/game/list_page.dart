import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  static const routeName = '/foodlist';

  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'FOOD MENU',
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