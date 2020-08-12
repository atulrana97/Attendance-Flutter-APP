import 'package:companyattendanceapp/Components/AddingEmployee.dart';
import 'package:companyattendanceapp/Components/Calender.dart';
import 'package:companyattendanceapp/Components/Profile.dart';
import 'package:companyattendanceapp/Screens/HomePage.dart';
import 'package:companyattendanceapp/Screens/Salary.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final tabs = [HomePage(), CalendarEmployee(), Salary(), Profile()];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        iconSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.lightBlueAccent,
            ),
            title: Text(
              'Staff',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_turned_in,
              color: Colors.lightBlueAccent,
            ),
            title: Text(
              'Attendance',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_pin_circle,
              color: Colors.lightBlueAccent,
            ),
            title: Text(
              'Hire',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.lightBlueAccent,
            ),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
