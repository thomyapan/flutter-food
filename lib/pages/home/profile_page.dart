import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const routeName = '/profile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(90.0),
                child: Container(
                  width: 170.0,
                  height: 170.0,
                  child: Image.asset('assets/images/profile.jpg'),
                )
            ),
            SizedBox(height: 8.0,),
            Text(
              'Natthaya Thomyapan',
              style: TextStyle(fontSize: 35.0,color: Colors.black,fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.0,),
            Text(
              'natthaya@gmail.com',
              style: TextStyle(fontSize: 25.0,color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}