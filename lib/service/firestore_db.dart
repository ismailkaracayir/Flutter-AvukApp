import 'package:avukapp/model/lawyer.dart';
import 'package:avukapp/model/user.dart';
import 'package:avukapp/service/db_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreDbService implements DBBase {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<UserModel>> getAllUser() {
    // TODO: implement getAllUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> readUser(String userID) async{
    DocumentSnapshot okunanUser =
        await firebaseFirestore.collection('users').doc(userID).get();
    UserModel user = UserModel.fromMap(okunanUser.data() as Map);
    debugPrint(
        '**********okunan user bilgileri ${user.toString()}***********');
    return user;
  }

  @override
  Future<bool> saveUser(UserModel user) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(user.userID)
          .set(user.ToMap());
      DocumentSnapshot readUser =
          await firebaseFirestore.doc("users/${user.userID}").get();
      Map readUserDetalys = readUser.data() as Map;
      UserModel _readUser = UserModel.fromMap(readUserDetalys);
      debugPrint(_readUser.toString());
    } catch (e) {
      debugPrint('CLOUDFİRE HATA ÇIKTI ${e.toString()} ');
    }

    return true;
  }

  @override
  Future<bool> saveLawyer(LawyerModel lawyer) async {
    try {
      await firebaseFirestore
          .collection('lawyers')
          .doc(lawyer.lawyerID)
          .set(lawyer.toMap());
      DocumentSnapshot readLawyer =
          await firebaseFirestore.doc("lawyer/${lawyer.lawyerID}").get();
      Map readUserDetalys = readLawyer.data() as Map;
      UserModel _readLawyer = UserModel.fromMap(readUserDetalys);
      debugPrint(_readLawyer.toString());
    } catch (e) {
      debugPrint('CLOUDFİRE HATA ÇIKTI ${e.toString()} ');
    }
    return true;
  }
}
