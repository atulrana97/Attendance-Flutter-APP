import 'package:auto_size_text/auto_size_text.dart';
import 'package:companyattendanceapp/Components/AddingEmployee.dart';
import 'package:companyattendanceapp/Components/Config.dart';
import 'package:flutter/material.dart';

class StartUpPage extends StatefulWidget {
  @override
  _StartUpPageState createState() => _StartUpPageState();
}

class _StartUpPageState extends State<StartUpPage> {
  String bullet = "\u2022 ";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: Container(
            height: SizeConfig.safeBlockVertical,
            width: SizeConfig.safeBlockHorizontal,
            child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Color(0x802196F3),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: AutoSizeText(
                      "Staff Manegement Made Easy",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                      child: AutoSizeText(
                        "$bullet Monthy fixed,daily, Weekly,Hourly and per peice workers",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 4.0, 10.0),
                      child: AutoSizeText(
                        "$bullet Record Salary,advance,pending payements",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 4.0, 10.0),
                      child: AutoSizeText(
                        "$bullet Mark Attendance,overtime(OT) and late deduction",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        minFontSize: 10,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 4.0, 20.0),
                      child: AutoSizeText(
                        "$bullet Send SMS and PDF report to Employees",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
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
                color: Colors.blue[800],
                elevation: 14.0,
                borderRadius: BorderRadius.circular(15.0),
                shadowColor: Color(0x802196F3),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                      style: TextStyle(fontSize: 30, color: Colors.white),
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
  }
}
