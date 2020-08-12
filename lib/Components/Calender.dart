import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companyattendanceapp/Components/Config.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarEmployee extends StatefulWidget {
  final DocumentSnapshot data;
  CalendarEmployee({this.data});
  @override
  _CalendarEmployeeState createState() => _CalendarEmployeeState();
}

class _CalendarEmployeeState extends State<CalendarEmployee> {
  CalendarController _calendarController;
  List<String> smonths = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'November',
    'December'
  ];
  int _day;
  int _month;
  int _year;
  String currentDate;
  var date;

  @override
  void initState() {
    super.initState();
    date = DateTime.now();
    _day = date.day;
    _month = date.month;
    _year = date.year;
    currentDate = "$_day ${smonths[_month]} $_year";
    _calendarController = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Attendance",
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0.2,
            leading: GestureDetector(
              onTap: () {
                _updateDateLeft();
              },
              child: Icon(
                Icons.arrow_left,
                color: Colors.blue,
              ),
            ),
            title: Center(
              child: Text(
                currentDate,
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                    onTap: () {
                      _updateDateRight();
                    },
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.blue,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }

  void _updateDateRight() {
    if (date.day > 1 && date.day < 28) {
      var ndate = DateTime(date.year, date.month, date.day + 1);
      setState(() {
        _day = ndate.day;
        _month = ndate.month;
        _year = ndate.year;
        currentDate = "$_day ${smonths[_month]} $_year";
        date = ndate;
      });
    }
  }

  void _updateDateLeft() {
    if (date.day > 1 && date.day < 28) {
      var ndate = DateTime(date.year, date.month, date.day - 1);
      setState(() {
        _day = ndate.day;
        _month = ndate.month;
        _year = ndate.year;
        currentDate = "$_day ${smonths[_month]} $_year";
        date = ndate;
      });
    }
  }
}
