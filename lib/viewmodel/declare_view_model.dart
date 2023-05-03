import 'package:avukapp/model/declare.dart';
import 'package:avukapp/model/lawyer.dart';
import 'package:avukapp/repository/declare_repository.dart';
import 'package:avukapp/service/db_base.dart';
import 'package:flutter/material.dart';
import '../lacator.dart';

class DeclareViewModel extends ChangeNotifier implements DBBaseDeclare {
  final DeclareRepository declareRepository = getIt<DeclareRepository>();

  LawyerModel? _declare;
  LawyerModel? get declare => _declare;

  @override
  Future<List<DeclareModel>> getAllDeclare() async {
    return await declareRepository.getAllDeclare();
  }

  @override
  Future<bool> saveDeclare(DeclareModel declare) async {
    return await declareRepository.saveDeclare(declare);
  }

  @override
  Future<bool> deleteDeclare(String declareId) async {
    return await declareRepository.deleteDeclare(declareId);
  }

  @override
  Future<bool> updateDeclare(
      String declareId,
      String declareTitle,
      String declareContent,
      String declareCategory,
      String declarePrice) async {
    return await declareRepository.updateDeclare(
        declareId, declareTitle, declareContent, declareCategory, declarePrice);
  }
}
