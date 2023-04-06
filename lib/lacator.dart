import 'package:avukapp/repository/user_repository.dart';
import 'package:avukapp/service/firebase_auth_service.dart';
import 'package:avukapp/service/firestore_db.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => FireBaseAuthService());
  getIt.registerLazySingleton(() => UserRepository());
    getIt.registerLazySingleton(() => FirestoreDbService());

   

}
