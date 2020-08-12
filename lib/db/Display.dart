import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companyattendanceapp/Components/AddingEmployee.dart';
import 'package:companyattendanceapp/Components/Calender.dart';
import 'package:companyattendanceapp/Components/Config.dart';
import 'package:companyattendanceapp/Components/Takingattendance.dart';
import 'package:companyattendanceapp/Screens/HomePage.dart';

import 'package:flutter/material.dart';

class GetDataDisplay extends StatefulWidget {
  final bool check1;
  GetDataDisplay({this.check1});
  @override
  _GetDataDisplayState createState() => _GetDataDisplayState();
}

class _GetDataDisplayState extends State<GetDataDisplay> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: Firestore.instance.collection('Employee').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot employee = snapshot.data.documents[index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: SizeConfig.safeBlockVertical,
                            width: double.infinity,
                            child: Material(
                                color: Colors.white,
                                elevation: 14.0,
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Color(0x802196F3),
                                child: ListTile(
                                  leading: Container(
                                      height: SizeConfig.safeBlockVertical,
                                      width: SizeConfig.safeBlockHorizontal,
                                      child: Material(
                                        elevation: 14.0,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        shadowColor: Color(0x802196F3),
                                        color: Colors.lightBlueAccent
                                            .withOpacity(0.5),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.attach_money,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      )),
                                  title: Text(
                                    'Total Salary',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: SizeConfig.safeBlockVertical,
                          width: double.infinity,
                          child: Material(
                            color: Colors.white,
                            elevation: 14.0,
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Color(0x802196F3),
                            child: ListTile(
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
                                radius: 40,
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
                              title: Text(employee['name'],
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Row(children: <Widget>[
                                Text(
                                  "Date Of Joining: ",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.7)),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      employee['day'].toString(),
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent),
                                    ),
                                    Text(
                                      '-',
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent),
                                    ),
                                    Text(
                                      employee['month'].toString(),
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent),
                                    ),
                                    Text(
                                      '-',
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent),
                                    ),
                                    Text(
                                      employee['year'].toString(),
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent),
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
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                            height: SizeConfig.safeBlockVertical,
                            width: SizeConfig.safeBlockHorizontal,
                            child: Material(
                              color: Colors.lightBlueAccent,
                              elevation: 14.0,
                              borderRadius: BorderRadius.circular(15.0),
                              shadowColor: Color(0x802196F3),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: ListTile(
                                  leading: Padding(
                                    padding: const EdgeInsets.only(left: 40.0),
                                    child: Icon(
                                      Icons.person_add,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(
                                    "Add Employee",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddEmployee(),
                                        ));
                                  },
                                ),
                              ),
                            )),
                      ),
                    ],
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
}
