import 'package:cloud_firestore/cloud_firestore.dart';

class LawyerModel {
  final String lawyerID;
  String email;
  String? userName;
  String pass;
  final String lawyerRegistrationNumber;
  String? profilImgURL;
  String? lawyerExperience; // avukat deneyimi
  String? lawyerField; // avukat alanı
  double? lawyerScore;
  DateTime? createAt;
  DateTime? updateAt;
  bool? isLawyer;

  LawyerModel(
      {required this.lawyerID,
      required this.email,
      required this.pass,
      required this.lawyerRegistrationNumber});

  Map<String, dynamic> toMap() {
    return {
      'lawyerID': lawyerID,
      'email': email ?? lawyerID,
      'userName': userName ?? email!.substring(0, email?.indexOf('@')),
      'lawyerRegistrationNumber': lawyerRegistrationNumber,
      'pass': pass,
      'profilImgURL': profilImgURL ??
          'https://st.depositphotos.com/1779253/5140/v/950/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg',
      'lawyerExperience': lawyerExperience,
      'lawyerField': lawyerField,
      'lawyerScore': lawyerScore,
      'createAt': createAt ?? FieldValue.serverTimestamp(),
      'updateAt': updateAt ?? FieldValue.serverTimestamp(),
      'level': isLawyer ?? false, // varsayılan kullanıcı yetkisi
    };
  }

  LawyerModel.fromMap(Map<dynamic, dynamic> map)
      : lawyerID = map['lawyerID'],
        email = map['email'],
        userName = map['userName'],
        pass = map['pass'],
        lawyerRegistrationNumber = map['lawyerRegistrationNumber'],
        lawyerExperience = map['lawyerExperience'],
        lawyerField = map['lawyerField'],
        profilImgURL = map['profilImgURL'],
        lawyerScore = map['lawyerScore'],
        createAt = (map['createAt'] as Timestamp).toDate(),
        updateAt = (map['updateAt'] as Timestamp).toDate(),
        isLawyer = map['isLawyer'];

// model sınıfı ekrana yazmırmak için kullanılan tostring
  @override
  String toString() {
    return 'lawyerID email :$email lawyer  name: $userName  lawyer profilurl: $profilImgURL users oluşturma tarih $createAt';
  }
}
