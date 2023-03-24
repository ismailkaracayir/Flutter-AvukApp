class LawyerModel {
  String? lawyerID;
  String? email;
  String? userName;
  String? pass;
  String? alani;
  String? content;
  String? lawyerRegistrationNumber;
  String? profilImgURL;
  DateTime? createAt;
  DateTime? updateAt;
  bool? isLawyer;
  LawyerModel({
    required this.email,
    required this.userName,
    required this.pass,
    required this.lawyerRegistrationNumber,
    required this.profilImgURL,
    required this.createAt,
    required this.updateAt,
    required this.alani,
    required this.isLawyer,
    required this.content,
  });
}

/// ****************************

class LawyerModel2 {
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

  LawyerModel2({
    required this.lawyerID,
    required this.email,
    required this.pass,
    required this.lawyerRegistrationNumber,
  });
}

List<LawyerModel2> avukatListe = [
  LawyerModel2(
    lawyerID: "00001",
    email: "utkubilgin.sau@gmail.com",
    pass: "utku123",
    lawyerRegistrationNumber: "0000 00001",
  ),
];
