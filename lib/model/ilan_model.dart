class DeclareModel {
  String? declareId;
  String? lawyerId;
  String? lawyerName;
  String? declareDate;
  String? declareTitle;
  String? declareContent;
  String? declareDescription;
  String? declareCategory;
  bool? isActive;

  DeclareModel(
      {this.declareId,
      this.lawyerId,
      this.lawyerName,
      this.declareDate,
      this.declareTitle,
      this.declareContent,
      this.declareDescription,
      this.declareCategory,
      this.isActive});

  DeclareModel.fromJson(Map<String, dynamic> json) {
    declareId = json['declareId'];
    lawyerId = json['lawyerId'];
    lawyerName = json['lawyerName'];
    declareDate = json['declareDate'];
    declareTitle = json['declareTitle'];
    declareContent = json['declareContent'];
    declareDescription = json['declareDescription'];
    declareCategory = json['declareCategory'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['declareId'] = declareId;
    data['lawyerId'] = lawyerId;
    data['lawyerName'] = lawyerName;
    data['declareDate'] = declareDate;
    data['declareTitle'] = declareTitle;
    data['declareContent'] = declareContent;
    data['declareDescription'] = declareDescription;
    data['declareCategory'] = declareCategory;
    data['isActive'] = isActive;
    return data;
  }
}
