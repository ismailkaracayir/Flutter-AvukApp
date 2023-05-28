import 'package:avukapp/model/appointment.dart';
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

  @override
  Future<bool> updateDeclare(
      String declareId,
      String declareTitle,
      String declareContent,
      String declareCategory,
      String declarePrice) async {
    return await firestoreDbService.updateDeclare(
        declareId, declareTitle, declareContent, declareCategory, declarePrice);
  }

  @override
  Future<List<DeclareModel>> getForIdDeclare(String lawyerId) async {
    return await firestoreDbService.getForIdDeclare(lawyerId);
  }

  @override
  Future<bool> saveAppointment(AppointmentModel appointment) async {
    return await firestoreDbService.saveAppointment(appointment);
  }

  @override
  Future<List<AppointmentModel>> getForIdAppointment(String userId) async {
    return await firestoreDbService.getForIdAppointment(userId);
  }

  @override
  Future<List<AppointmentModel>> getForIdLwyerAppointment(
      String lawyerId) async {
    return await firestoreDbService.getForIdLawyerAppointment(lawyerId);
  }
}
