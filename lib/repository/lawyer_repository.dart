import 'package:avukapp/service/db_base.dart';
import '../lacator.dart';
import '../model/lawyer.dart';
import '../service/firestore_db.dart';

class LawyerRepository implements DBBaselawyer {
  final FirestoreDbService firestoreDbService = getIt<FirestoreDbService>();

  @override
  Future<List<LawyerModel>> getAllLawyer() async {
    return await firestoreDbService.getAllLawyer();
  }

  @override
  Future<LawyerModel> readLawyer(String lawyerID) async {
    return await firestoreDbService.readLawyer(lawyerID);
  }
}
