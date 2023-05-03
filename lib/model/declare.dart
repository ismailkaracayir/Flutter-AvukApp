import 'package:cloud_firestore/cloud_firestore.dart';

class DeclareModel {
  String? declareId; // otomatik oluşacak
  String? lawyerId; // lawyer tablodan gelecek
  DateTime? declareDate; // sistem saati alınacak
  String? declareTitle; // ilan sayfasından alınacak
  String? declareContent; // ilan sayfasından alınacak
  String? declareCategory; // ilan sayfasından alınacak
  String? declarePrice;
  bool? isActive;

  DeclareModel(
      {this.declareId,
      this.lawyerId,
      this.declareDate,
      this.declareTitle,
      this.declareContent,
      this.declareCategory,
      this.declarePrice,
      this.isActive});

  Map<String, dynamic> toMap() {
    return {
      'declareId': declareId,
      'lawyerId': lawyerId,
      'declareDate': declareDate ?? FieldValue.serverTimestamp(),
      'declareTitle': declareTitle,
      'declareContent': declareContent,
      'declareCategory': declareCategory,
       'declarePrice': declarePrice,
      'isActive': isActive ??
          true, // varsayılan ilan aktiflik durumu İLAN DÜZENLE SAYFASI İÇİN KULLANILACAK
    };
  }

  DeclareModel.fromMap(Map<dynamic, dynamic> map)
      : declareId = map['declareId'],
        lawyerId = map['lawyerId'],
        declareDate = (map['declareDate'] as Timestamp).toDate(),
        declareTitle = map['declareTitle'],
        declareContent = map['declareContent'],
        declareCategory = map['declareCategory'],
        declarePrice = map['declarePrice'],
        isActive = map['isActive'];

  // // declareId = json['declareId'];
  // // lawyerId = json['lawyerId'];
  // // lawyerName = json['lawyerName'];
  // // declareDate = json['declareDate'];
  // // declareTitle = json['declareTitle'];
  // // declareContent = json['declareContent'];
  // // declareDescription = json['declareDescription'];
  // // declareCategory = json['declareCategory'];
  // // isActive = json['isActive'];

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['declareId'] = declareId;
  //   data['lawyerId'] = lawyerId;
  //   data['lawyerName'] = lawyerName;
  //   data['declareDate'] = declareDate;
  //   data['declareTitle'] = declareTitle;
  //   data['declareContent'] = declareContent;
  //   data['declareDescription'] = declareDescription;
  //   data['declareCategory'] = declareCategory;
  //   data['isActive'] = isActive;
  //   return data;
  // }
}
