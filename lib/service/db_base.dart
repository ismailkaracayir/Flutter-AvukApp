import 'package:avukapp/model/declare.dart';

import '../model/lawyer.dart';
import '../model/user.dart';

abstract class DBBase {
  Future<bool> saveUser(UserModel user);
  Future<UserModel> readUser(String userID);
  Future<List<UserModel>> getAllUser();
  Future<bool> saveLawyer(LawyerModel lawyer);
}

abstract class DBBaselawyer {
  Future<LawyerModel> readLawyer(String lawyerID);
  Future<List<LawyerModel>> getAllLawyer();
  Future<bool> lawyerActiveControlAdmin(String lawyerID, bool isActive);
}

abstract class DBBaseDeclare {
  Future<bool> saveDeclare(DeclareModel declare);
  Future<List<DeclareModel>> getAllDeclare();
  Future<bool> deleteDeclare(String declareId);
}
