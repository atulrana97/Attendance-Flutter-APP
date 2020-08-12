import 'package:companyattendanceapp/db/AttendanceService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadAttendance extends StatefulWidget {
  @override
  _UploadAttendanceState createState() => _UploadAttendanceState();
}

class _UploadAttendanceState extends State<UploadAttendance> {
  List<DropdownMenuItem<String>> attendance = <DropdownMenuItem<String>>[];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _currentattendance;
  bool isLoading = false;
  AttendanceService _attendanceService = AttendanceService();
  var _date = DateTime.now();

  @override
  void initState() {
    attendance = _getDayDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
            key: _formKey,
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : Stack(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Atul",
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                DateTime.now().toString(),
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Attendance :',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                  items: attendance,
                                  onChanged: changeSelectedattendance,
                                  value: _currentattendance),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              child: FlatButton(
                                color: Colors.lightBlueAccent,
                                textColor: Colors.white,
                                child: Text("Upload Attendance"),
                                onPressed: () {
                                  validateAndUpload();
                                },
                              ),
                            )
                          ]),
                        ),
                      ],
                    )
                  ])));
  }

  changeSelectedattendance(String month) {
    setState(() {
      _currentattendance = month;
    });
  }

  List<DropdownMenuItem<String>> _getDayDropDown() {
    List<DropdownMenuItem<String>> items = new List();
    setState(() {
      items.insert(
          0,
          DropdownMenuItem(
            child: Text("Present"),
            value: "Present",
          ));
      items.insert(
          1,
          DropdownMenuItem(
            child: Text("Absent"),
            value: "Absent",
          ));
    });
    return items;
  }

  void validateAndUpload() {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      _attendanceService.uploadAttendance(
        name: "Atul",
        date: DateTime.now().toString(),
        id: '3371bbf0-d826-11ea-9b58-074e4cc131cd',
        attendance: _currentattendance,
      );
      _formKey.currentState.reset();
      setState(() {
        isLoading = false;
      });
      FlutterToast.showToast(msg: 'Products added');
      Navigator.pop(context);
    }
    ;
  }
}
