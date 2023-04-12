import 'package:avukapp/model/declare.dart';
import 'package:avukapp/service/db_base.dart';
import '../lacator.dart';
import '../service/firestore_db.dart';

class DeclareRepository implements DBBaseDeclare {
  final FirestoreDbService firestoreDbService = getIt<FirestoreDbService>();

  @override
  Future<List<DeclareModel>> getAllDeclare() async {
    return await firestoreDbService.getAllDeclate();
  }

  @override
  Future<bool> saveDeclare(DeclareModel declare) async {
    return await firestoreDbService.saveDeclare(declare);
  }

  @override
  Future<bool> deleteDeclare(String declareId) async {
    return await firestoreDbService.deleteDeclare(declareId);
  }
}
