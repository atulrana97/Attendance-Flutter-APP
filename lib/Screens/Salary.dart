import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companyattendanceapp/Components/AddingEmployee.dart';
import 'package:companyattendanceapp/Components/Calender.dart';
import 'package:companyattendanceapp/Components/EmployeeCard.dart';
import 'package:companyattendanceapp/Components/Takingattendance.dart';
import 'package:flutter/material.dart';

class Salary extends StatefulWidget {
  @override
  _SalaryState createState() => _SalaryState();
}

class _SalaryState extends State<Salary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("DayToDay"),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddEmployee()));
              },
            )
          ],
        ),
      ),
      drawer: Drawer(),
      body: StreamBuilder(
          stream: Firestore.instance.collection('Employee').snapshots(),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot employee =
                          snapshot.data.documents[index];
                      return EmployeeCart(
                        name: employee['name'],
                        picture: employee['picture'],
                        salary: employee['salary'],
                      );
                      /*ListTile(
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
                      );*/
                    },
                  );
          }),
    );
  }
}
