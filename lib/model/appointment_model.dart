class AppointmentModel {
  String? id;
  String? idAvukat;
  String? idMusteri;
  String? randevuTarihi;
  String? radevuSaat;
  int? randevuUcret;
  bool? isActive;

  AppointmentModel({
    required this.id,
    required this.idAvukat,
    required this.idMusteri,
    required this.randevuTarihi,
    required this.radevuSaat,
    required this.randevuUcret,
    required this.isActive,
  });

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idAvukat = json['idAvukat'];
    idMusteri = json['idMusteri'];
    randevuTarihi = json['randevuTarihi'];
    radevuSaat = json['radevuSaat'];
    randevuUcret = json['randevuUcret'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idAvukat'] = idAvukat;
    data['idMusteri'] = idMusteri;
    data['randevuTarihi'] = randevuTarihi;
    data['radevuSaat'] = radevuSaat;
    data['randevuUcret'] = randevuUcret;
    data['isActive'] = isActive;
    return data;
  }
}
