import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'profile.dart';

class homeuser extends StatefulWidget {
  const homeuser({Key? key}) : super(key: key);

  @override
  State<homeuser> createState() => _homeuserState();
}

class _homeuserState extends State<homeuser> {
  int screensindex = 0;
  final screens = [
    profile(),
    Center(child: Text('test1'),),
    Center(child: Text('test2'),),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homeuser',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: screens[screensindex],
        bottomNavigationBar: ConvexAppBar(
          
      items: [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.map, title: 'Discovery'),
        TabItem(icon: Icons.person, title: 'Profile'),
      ],
      initialActiveIndex: screensindex, //optional, default as 0
      onTap: (index) => setState(() => screensindex = index),
    ),);
  }
}
