import '../entities/user_entity.dart';
import '../repositories/firebase_repository.dart';

class GetAllUsersUseCase {
  final FirebaseRepository repository;

  GetAllUsersUseCase({required this.repository});

  Stream<List<UserEntity>> call() {
    return repository.getAllUsers();
  }
}
