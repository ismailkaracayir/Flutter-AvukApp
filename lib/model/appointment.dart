import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  String? appointmentID;
  String? userID;
  String? lawyerID;
  String? description;
  DateTime? createDate; // sistem saati alınacak
  DateTime? appointmentDate;
  bool? isActive;

  AppointmentModel(
      {this.appointmentID, this.userID, this.lawyerID, this.description});

  Map<String, dynamic> toMap() {
    return {
      'AppointmentID': appointmentID,
      'userID': userID,
      'lawyerID': lawyerID,
      'description': description,
      'createDate': createDate ?? FieldValue.serverTimestamp(),
      'appointmentDate': appointmentDate,
      'isActive': isActive ?? false
    };
  }

  AppointmentModel.fromMap(Map<dynamic, dynamic> map)
      : appointmentID = map['AppointmentID'],
        userID = map['userID'],
        lawyerID = map['lawyerID'],
        description = map['description'],
        createDate = (map['createDate'] as Timestamp).toDate(),
        appointmentDate = (map['appointmentDate']),
        isActive = map['isActive'];
}
