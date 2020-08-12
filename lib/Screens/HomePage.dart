import 'dart:async';

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companyattendanceapp/Components/AddingEmployee.dart';
import 'package:companyattendanceapp/Screens/Startup.dart';
import 'package:companyattendanceapp/db/Display.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final bool check1;
  HomePage({this.check1});
  @override
  _HomePageState createState() => _HomePageState();

  void initState() {}
}

class _HomePageState extends State<HomePage> {
  bool check = true;

  @override
  void initState() {
    super.initState();
    if (widget.check1 != null) {
      check = widget.check1;
    }
    checkIfLikedOrNot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "DayToDay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                child: Icon(Icons.person_add),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddEmployee()));
                },
              ),
            )
          ]),
      drawer: Drawer(),
      body: check == false ? StartUpPage() : GetDataDisplay(),
    );
  }

  void checkIfLikedOrNot() async {
    var ds = await Firestore.instance.collection("Employee").getDocuments();
    this.setState(() {
      if (ds.documents.length == 0) {
        check = false;
      } else {
        check = true;
      }
    });
    print(check);
  }
}
