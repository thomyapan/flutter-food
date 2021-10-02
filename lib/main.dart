import 'package:flutter/material.dart';
import 'package:untitled/pages/game/login_page.dart';
import 'package:untitled/pages/game/food_page.dart';
import 'package:untitled/pages/game/list_page.dart';
import 'package:untitled/pages/game/order_page.dart';
import 'package:untitled/pages/home/home_page.dart';
import 'package:untitled/pages/home/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          headline6: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      // home: LoginPage(),
      routes: {
        LoginPage.routeName : (context) => const LoginPage(),
        HomePage.routeName : (context) => const HomePage(),
        FoodPage.routeName : (context) => const FoodPage(),
        Profile.routeName : (context) => const Profile(),
        FoodListPage.routeName : (context) => const FoodListPage(),
        OrderPage.routeName : (context) => const OrderPage(),
      },
      initialRoute: '/login',
    );
  }
}
