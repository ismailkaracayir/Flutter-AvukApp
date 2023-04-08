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
}
