import 'package:avukapp/model/user.dart';

abstract class AuthBase {
  Future<UserModel> currentUser();
  Future<bool> singOut();
  Future<UserModel> singInWithGoogle();
  Future<UserModel> singInWithEmailAndPass(String email, String pass);
  Future<UserModel> createWithUserEmailAndPass(String email, String pass,String userName);
}
