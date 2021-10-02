import 'package:flutter/material.dart';
import 'package:untitled/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  var count = 0;
  var password = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.pinkAccent,
              Colors.white70,
              Colors.cyan,
              // Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 100.0,
                        color: Colors.black54,
                      ),
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8.0,),
                      Text(
                        'Enter PIN to login',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < count; i++)
                              Icon(
                                Icons.circle,
                                color: Colors.pinkAccent,
                                size: 30.0,
                              ),
                            for (var j = 0; j < (6 - count); j++)
                              Icon(
                                Icons.circle,
                                color: Colors.grey,
                                size: 30.0,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButton(int num) {
    print('Number: $num');
    setState(() {
      if (num == -1) {
        if (input.length > 0) input = input.substring(0, input.length - 1);
        count--;
      } else {
        input = '$input$num';
        count++;
      }
      if (input.length == 6 && input == password) {
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else if (input.length == 6 && input != password) {
        input = '';
        count = 0;
        return _showMaterialDialog('ERROR', 'Invalid PIN. Please try again.');
      }
    });
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: 32, color: Colors.pink),
          ),
          content: Text(
            msg,
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    Key? key,
    required this.number,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : () => onClick(number),
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
          border: Border.all(width: 3.0, color: Colors.black54),
        ),
        child: Center(
          child: number >= 0
              ? Text(
            '$number',
            style: Theme.of(context).textTheme.headline6,
          )
              : number == -1
              ? Icon(
            Icons.backspace_outlined,
            size: 28.0,
          )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}