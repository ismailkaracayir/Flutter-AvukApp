import 'package:cloud_firestore/cloud_firestore.dart';

class LawyerModel {
  final String lawyerID;
  String email;
  String? userName;
  final String lawyerBaroNumber;
  String? profilImgURL;
  String? lawyerExperience; // avukat deneyimi
  String? lawyerField; // avukat alanı
  double? lawyerScore;
  DateTime? createAt;
  DateTime? updateAt;
  bool? isActive;

  LawyerModel(
      {required this.lawyerID,
      required this.email,
      required this.lawyerBaroNumber,
      required this.userName});

  Map<String, dynamic> toMap() {
    return {
      'lawyerID': lawyerID,
      'email': email,
      'userName': userName,
      'lawyerBaroNumber': lawyerBaroNumber,
      'profilImgURL': profilImgURL ??
          'https://st.depositphotos.com/1779253/5140/v/950/depositphotos_51405259-stock-illustration-male-avatar-profile-picture-use.jpg',
      'lawyerExperience': lawyerExperience,
      'lawyerField': lawyerField,
      'lawyerScore': lawyerScore,
      'createAt': createAt ?? FieldValue.serverTimestamp(),
      'updateAt': updateAt ?? FieldValue.serverTimestamp(),
      'isActive': isActive ?? false, // varsayılan kullanıcı yetkisi
    };
  }

  LawyerModel.fromMap(Map<dynamic, dynamic> map)
      : lawyerID = map['lawyerID'],
        email = map['email'],
        userName = map['userName'],
        lawyerBaroNumber = map['lawyerBaroNumber'],
        lawyerExperience = map['lawyerExperience'],
        lawyerField = map['lawyerField'],
        profilImgURL = map['profilImgURL'],
        lawyerScore = map['lawyerScore'],
        createAt = (map['createAt'] as Timestamp).toDate(),
        updateAt = (map['updateAt'] as Timestamp).toDate(),
        isActive = map['isActive'];

// model sınıfı ekrana yazmırmak için kullanılan tostring
  @override
  String toString() {
    return 'lawyerID email :$email lawyer  name: $userName  lawyer profilurl: $profilImgURL users oluşturma tarih $createAt';
  }
}
