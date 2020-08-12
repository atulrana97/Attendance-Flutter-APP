import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';

class AttendanceService {
  Firestore _firestore = Firestore.instance;
  String ref = 'Attendance';

  void uploadAttendance({
    String name,
    String id,
    String date,
    String attendance,
  }) {
    _firestore
        .collection(ref)
        .document(id)
        .setData({"id": id, "attendance": attendance, "date": date});
  }
}
