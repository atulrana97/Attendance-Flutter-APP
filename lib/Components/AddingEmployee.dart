import 'dart:io';

import 'package:companyattendanceapp/Screens/HomePage.dart';
import 'package:companyattendanceapp/db/EmployeeService.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  File img;
  EmployeeService employeeService = EmployeeService();
  TextEditingController nameTextController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  List<DropdownMenuItem<int>> dayOfJoining = <DropdownMenuItem<int>>[];
  List<DropdownMenuItem<int>> monthOfJoining = <DropdownMenuItem<int>>[];
  List<DropdownMenuItem<int>> yearOfJoining = <DropdownMenuItem<int>>[];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  int _currentday;
  int _currentmonth;
  int _currentyear;
  HomePage _homePage = HomePage();

  @override
  void initState() {
    dayOfJoining = _getDayDropDown();
    monthOfJoining = _getMonthDropDown();
    yearOfJoining = _getYearDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.1,
            backgroundColor: Colors.lightBlueAccent,
            leading: IconButton(
              icon: Icon(Icons.close),
              color: Colors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Add Employee",
              style: TextStyle(color: Colors.black),
            )),
        body: Form(
          key: _formKey,
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Employee Picture",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.lightBlueAccent),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OutlineButton(
                                    onPressed: () {
                                      _selectImage(
                                          ImagePicker.pickImage(
                                              source: ImageSource.gallery),
                                          1);
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        side: BorderSide(color: Colors.grey)),
                                    child: _displayChild1()),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter the Employee Name(maximum 20 character)*",
                        style: TextStyle(color: Colors.lightBlue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: nameTextController,
                        decoration: InputDecoration(hintText: 'Product Name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter the Product Name';
                          } else if (value.length > 20) {
                            return 'Product Name cannot have more than 20 letters';
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Day :',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                  items: dayOfJoining,
                                  onChanged: changeSelectedDay,
                                  value: _currentday),
                            ),
                          ]),
                        ),
                        Expanded(
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Month :',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                  items: monthOfJoining,
                                  onChanged: changeSelectedMonth,
                                  value: _currentmonth),
                            ),
                          ]),
                        ),
                        Expanded(
                          child: Column(children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Year :',
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton(
                                  items: yearOfJoining,
                                  onChanged: changeSelectedYear,
                                  value: _currentyear),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 20.0),
                      child: TextFormField(
                        controller: salaryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Salary", hintText: 'Salary'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'You must enter minimum salary';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: FlatButton(
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        child: Text("Add Employee"),
                        onPressed: () {
                          validateAndUpload();
                        },
                      ),
                    )
                  ],
                ),
        ));
  }

  List<DropdownMenuItem<int>> _getDayDropDown() {
    List<DropdownMenuItem<int>> items = new List();
    for (int i = 31; i >= 1; i--) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
              child: Text(i.toString()),
              value: i,
            ));
      });
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getMonthDropDown() {
    List<DropdownMenuItem<int>> items = new List();
    for (int i = 12; i >= 1; i--) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
              child: Text(i.toString()),
              value: i,
            ));
      });
    }
    return items;
  }

  List<DropdownMenuItem<int>> _getYearDropDown() {
    List<DropdownMenuItem<int>> items = new List();
    for (int i = 2020; i >= 2000; i--) {
      setState(() {
        items.insert(
            0,
            DropdownMenuItem(
              child: Text(i.toString()),
              value: i,
            ));
      });
    }
    return items;
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;

    setState(() => img = tempImg);
  }

  changeSelectedDay(int day) {
    setState(() {
      _currentday = day;
    });
  }

  changeSelectedMonth(int month) {
    setState(() {
      _currentmonth = month;
    });
  }

  changeSelectedYear(int year) {
    setState(() {
      _currentyear = year;
    });
  }

  Widget _displayChild1() {
    if (img == null) {
      return Padding(
          padding: EdgeInsets.fromLTRB(20, 70, 20, 70),
          child: Icon(Icons.add, color: Colors.grey));
    } else {
      return Image.file(
        img,
        fit: BoxFit.contain,
        height: 90,
        width: 100,
      );
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      if (img != null) {
        if (nameTextController.text.isNotEmpty) {
          String imageUrl1;

          final FirebaseStorage storage = FirebaseStorage.instance;
          final String picture1 =
              "1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
          StorageUploadTask task1 = storage.ref().child(picture1).putFile(img);

          StorageTaskSnapshot snapshot1 =
              await task1.onComplete.then((snapshot) => snapshot);

          task1.onComplete.then((snapshot3) async {
            imageUrl1 = await snapshot1.ref.getDownloadURL();

            employeeService.uploadProduct(
                name: nameTextController.text,
                salary: salaryController.text,
                day: _currentday,
                month: _currentmonth,
                year: _currentyear,
                images: imageUrl1);
            _formKey.currentState.reset();
            setState(() {
              isLoading = false;
            });
            FlutterToast.showToast(msg: 'Products added');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(check1: true)));
          });

          //ProductService.uploadProduct()
        } else {
          setState(() => isLoading = false);
          FlutterToast.showToast(msg: 'No quantity selected');
        }
      }
    } else {
      setState(() => isLoading = false);
      FlutterToast.showToast(msg: 'Must Provide atleast 1 image');
    }
  }
}
