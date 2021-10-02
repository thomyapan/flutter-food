import 'package:flutter/material.dart';
import 'package:untitled/pages/game/food_page.dart';
import 'package:untitled/pages/home/profile_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(_subPageIndex == 0 ? 'Food' : 'Profile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/profile.jpg'),
                      )),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Natthaya Thomyapan',
                    style: TextStyle(fontSize: 22.0, color: Colors.white),
                  ),
                  Text(
                    'natthaya@gmail.com',
                    style: TextStyle(fontSize: 18.0, color: Colors.white60),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.fastfood), 'Food'),
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(Icon(Icons.person), 'Profile'),
              onTap: () => _showSubPage(1),
            ),
          ],
        ),
      ),
      body: _buildSubPage(),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0:
        return FoodPage();
      case 1:
        return Profile();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}