import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class EmployeeService {
  Firestore _firestore = Firestore.instance;
  String ref = 'Employee';

  void uploadProduct(
      {String name,
      int day,
      int month,
      int year,
      String salary,
      String images,
      double price}) {
    var id = Uuid();
    String employeeId = id.v1();

    _firestore.collection(ref).document(employeeId).setData({
      "name": name,
      "id": employeeId,
      "day": day,
      "month": month,
      "year": year,
      "salary": salary,
      "picture": images,
    });
  }
}
