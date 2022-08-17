import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:sapyangyuen/user/calendar.dart';
import 'package:sapyangyuen/user/contact.dart';
import 'profile.dart';
import 'home.dart';

class homeuser extends StatefulWidget {
  const homeuser({Key? key}) : super(key: key);

  @override
  State<homeuser> createState() => _homeuserState();
}

class _homeuserState extends State<homeuser> {
  int screensindex = 0;
  final screens = [
    Home(),
    calendar(),
    profile(),
    contact(),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Homeuser',style: TextStyle(color: Colors.black),),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.logout),
                color: Colors.black,
                tooltip: 'Logout',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('This is a Logout')));
                },
              ),
            ),
          ],
        ),

        body: screens[screensindex],
          bottomNavigationBar: ConvexAppBar(

        items: [
          TabItem(icon: Icons.home, title: 'หน้าหลัก'),
          TabItem(icon: Icons.calendar_month, title: 'ปฏิทิน'),
          TabItem(icon: Icons.person, title: 'โปรไฟล์'),
          TabItem(icon: Icons.contacts, title: 'การติดต่อ'),

        ],
        initialActiveIndex: screensindex, //optional, default as 0
        onTap: (index) => setState(() => screensindex = index),
        backgroundColor: Color.fromARGB(255, 40, 54, 176),
      ),
    );
  }
}
