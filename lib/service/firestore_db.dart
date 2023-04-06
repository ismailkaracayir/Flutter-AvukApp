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
  Future<UserModel> readUser(String userID) {
    // TODO: implement readUser
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser(UserModel user) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(user.userID)
          .set(user.ToMap());
      debugPrint(
          'SAVEUSER İÇİNDEKİ READ USER--------------------- ${user.userID}');

      DocumentSnapshot readUser =
          await firebaseFirestore.doc("users/${user.userID}").get();
      debugPrint('SAVEUSER İÇİNDEKİ READ USER ${readUser.data().toString()}');
      Map readUserDetalys = readUser.data() as Map;
      UserModel _readUser = UserModel.fromMap(readUserDetalys);
      debugPrint(_readUser.toString());
    } catch (e) {
      debugPrint('CLOUDFİRE HATA ÇIKTI ${e.toString()} ');
    }

    return true;
  }
}
