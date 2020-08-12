import 'dart:async';

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companyattendanceapp/Components/AddingEmployee.dart';
import 'package:companyattendanceapp/Components/Calender.dart';
import 'package:companyattendanceapp/Components/Takingattendance.dart';
import 'package:companyattendanceapp/Screens/Startup.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final bool check1;
  HomePage({this.check1});
  @override
  _HomePageState createState() => _HomePageState();

  void initState() {}
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      body: check == false
          ? StartUpPage()
          : StreamBuilder(
              stream: Firestore.instance.collection('Employee').snapshots(),
              builder: (context, snapshot) {
                print(check);
                if (!snapshot.hasData) {
                  print(snapshot.hasData);
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot employee =
                          snapshot.data.documents[index];

                      return ListTile(
                        onLongPress: () {
                          _categoryAlert(employee);
                        },
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalendarEmployee(
                                        data: employee,
                                      )));
                        },
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.lightBlue,
                          child: ClipOval(
                            child: SizedBox(
                              width: 50.0,
                              height: 100.0,
                              child: Image.network(employee['picture'],
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        title: Text(employee['name']),
                        subtitle: Row(children: <Widget>[
                          Text(
                            "Date Of Joining: ",
                            style:
                                TextStyle(color: Colors.grey.withOpacity(0.7)),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                employee['day'].toString(),
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                              Text(
                                '-',
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                              Text(
                                employee['month'].toString(),
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                              Text(
                                '-',
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                              Text(
                                employee['year'].toString(),
                                style: TextStyle(color: Colors.lightBlueAccent),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.check_circle),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UploadAttendance()));
                            },
                          )
                        ]),
                      );
                    },
                  );
                }
              }),
    );
  }

  void _categoryAlert(employee) {
    var alert = new AlertDialog(
      content: Form(
        key: _formKey,
        child: Text("Do you want to remove this Employee"),
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () async {
              await Firestore.instance
                  .runTransaction((Transaction transaction) async {
                await transaction.delete(employee.reference);
              });
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text('Yes')),
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('NO')),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
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
