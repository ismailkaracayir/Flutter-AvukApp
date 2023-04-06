import 'package:avukapp/model/lawyer.dart';

import '../model/user.dart';

abstract class DBBase {
  Future<bool> saveUser(UserModel user);
  Future<UserModel> readUser(String userID);
  Future<List<UserModel>> getAllUser();
  Future<bool> saveLawyer(LawyerModel lawyer);
}
