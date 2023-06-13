import 'package:cloud_firestore/cloud_firestore.dart';

class FavDeclareModel {
  String? declareId; // otomatik oluşacak
  String? lawyerId; // lawyer tablodan gelecek
  DateTime? declareDate; // sistem saati alınacak
  String? declareTitle; // ilan sayfasından alınacak
  String? declareContent; // ilan sayfasından alınacak
  String? declareCategory; // ilan sayfasından alınacak
  String? declarePrice;
  String? lawyerProfilUrl;
  bool? isActive;
  String? userID;

  FavDeclareModel(
      {this.declareId,
      this.lawyerId,
      this.declareDate,
      this.declareTitle,
      this.declareContent,
      this.declareCategory,
      this.declarePrice,
      this.lawyerProfilUrl,
      this.isActive,
      this.userID});

  Map<String, dynamic> toMap() {
    return {
      'declareId': declareId,
      'lawyerId': lawyerId,
      'declareDate': declareDate ?? FieldValue.serverTimestamp(),
      'declareTitle': declareTitle,
      'declareContent': declareContent,
      'declareCategory': declareCategory,
      'declarePrice': declarePrice,
      'lawyerProfilUrl': lawyerProfilUrl,
      'isActive': isActive ?? true,
      'userID': userID,
    };
  }

  FavDeclareModel.fromMap(Map<dynamic, dynamic> map)
      : declareId = map['declareId'],
        lawyerId = map['lawyerId'],
        declareDate = (map['declareDate'] as Timestamp).toDate(),
        declareTitle = map['declareTitle'],
        declareContent = map['declareContent'],
        declareCategory = map['declareCategory'],
        declarePrice = map['declarePrice'],
        lawyerProfilUrl = map['lawyerProfilUrl'],
        isActive = map['isActive'],
        userID = map['userID'];



}
