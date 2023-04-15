import 'package:avukapp/model/lawyer.dart';
import 'package:avukapp/repository/lawyer_repository.dart';
import 'package:avukapp/service/db_base.dart';
import 'package:flutter/material.dart';

import '../lacator.dart';

class LawyerViewModel extends ChangeNotifier implements DBBaselawyer {
  final LawyerRepository lawyerRepository = getIt<LawyerRepository>();

  LawyerModel? _lawyer;
  LawyerModel? get lawyer => _lawyer;

  @override
  Future<LawyerModel> readLawyer(String lawyerID) async {
    _lawyer = await lawyerRepository.readLawyer(lawyerID);
    return lawyer!;
  }

  @override
  Future<List<LawyerModel>> getAllLawyer() async {
    return await lawyerRepository.getAllLawyer();
  }

  @override
  Future<bool> lawyerActiveControlAdmin(String lawyerID, bool isActive) async {
    return await lawyerRepository.lawyerActiveControlAdmin(lawyerID, isActive);
  }
}
