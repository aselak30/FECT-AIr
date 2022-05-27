import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:clean_air/screens/HomePage.dart';
import 'package:clean_air/screens/PurpleAir.dart';
import 'package:clean_air/screens/notifications.dart';
import 'package:clean_air/screens/weather.dart';
import 'package:flutter/material.dart';




class navigation extends StatefulWidget {
  const navigation({ Key? key }) : super(key: key);

  @override
  _navigationState createState() => _navigationState();
}

class _navigationState extends State<navigation> {


  int _selectedIndex = 0;

  final screens = [
    HomePage(),
    PurpleAir(),
    weather(),
    notifications()    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.air_outlined),
              title: Text('Air Quality'),
              activeColor: Colors.black,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.map_outlined),
                title: Text('Purple Air'),
                activeColor: Colors.black),
            
            BottomNavyBarItem(
                icon: Icon(Icons.wb_sunny),
                title: Text('Weather'),
                activeColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.notifications),
                title: Text('Notification'),
                activeColor: Colors.black),
          ],
        ));
  }
}