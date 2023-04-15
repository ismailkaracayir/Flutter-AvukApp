import 'package:avukapp/model/declare.dart';
import 'package:avukapp/model/lawyer.dart';
import 'package:avukapp/model/user.dart';
import 'package:avukapp/service/db_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FirestoreDbService implements DBBase {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<UserModel>> getAllUser() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('users').get();
    List<UserModel> allUser = [];
    for (DocumentSnapshot user in querySnapshot.docs) {
      UserModel tekUser = UserModel.fromMap(user.data() as Map);
      allUser.add(tekUser);
    }
    return allUser;
  }

  @override
  Future<UserModel> readUser(String userID) async {
    DocumentSnapshot okunanUser =
        await firebaseFirestore.collection('users').doc(userID).get();
    UserModel user = UserModel.fromMap(okunanUser.data() as Map);
    debugPrint('**********okunan user bilgileri ${user.toString()}***********');
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

  Future<LawyerModel> readLawyer(String lawyerID) async {
    DocumentSnapshot readLawyer =
        await firebaseFirestore.collection('lawyers').doc(lawyerID).get();
    LawyerModel lawyer = LawyerModel.fromMap(readLawyer.data() as Map);
    return lawyer;
  }

  Future<List<LawyerModel>> getAllLawyer() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('lawyers').get();
    List<LawyerModel> alllawyer = [];
    for (DocumentSnapshot lawyer in querySnapshot.docs) {
      LawyerModel oneLawyer = LawyerModel.fromMap(lawyer.data() as Map);
      alllawyer.add(oneLawyer);
    }
    return alllawyer;
  }

  Future<bool> lawyerActiveControlAdmin(String lawyerID, bool isActive) async {
    if (isActive == true) {
      await firebaseFirestore
          .collection('lawyers')
          .doc(lawyerID)
          .update({'isActive': isActive});
      return true;
    } else {
      await firebaseFirestore
          .collection('lawyers')
          .doc(lawyerID)
          .update({'isActive': isActive});
      return false;
    }
  }

  Future<bool> saveDeclare(DeclareModel declare) async {
    try {
      var _decID = firebaseFirestore.collection('declare').doc().id;
      declare.declareId = _decID;

      await firebaseFirestore
          .collection('declare')
          .doc(declare.declareId)
          .set(declare.toMap());

      DocumentSnapshot readDeclare =
          await firebaseFirestore.doc("declare/${declare.declareId}").get();
      Map readDeclareDetalys = readDeclare.data() as Map;
      DeclareModel _readDeclare = DeclareModel.fromMap(readDeclareDetalys);
      debugPrint(_readDeclare.toString());
    } catch (e) {
      debugPrint('CLOUDFİRE DECLARE  HATA ÇIKTI ${e.toString()} ');
    }
    return true;
  }

  Future<List<DeclareModel>> getAllDeclate() async {
    QuerySnapshot querySnapshot =
        await firebaseFirestore.collection('declare').get();
    List<DeclareModel> allDeclare = [];
    for (DocumentSnapshot declare in querySnapshot.docs) {
      DeclareModel oneDeclare = DeclareModel.fromMap(declare.data() as Map);
      allDeclare.add(oneDeclare);
    }
    return allDeclare;
  }

  Future<bool> deleteDeclare(String declareId) async {
    DocumentReference temp =
        firebaseFirestore.collection('declare').doc(declareId);
    temp.delete();
    return true;
  }

  @override
  Future<void> updateUserProfileImageUrl(String userId, String imageUrl) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(userId)
          .update({'profilImgURL': imageUrl});
    } catch (e) {
      print('Error updating user profile image URL: $e');
    }
  }
}
