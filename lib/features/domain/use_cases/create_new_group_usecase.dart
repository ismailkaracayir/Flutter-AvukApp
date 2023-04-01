import '../entities/my_chat_entity.dart';
import '../repositories/firebase_repository.dart';

class CreateNewGroupUseCase {
  final FirebaseRepository repository;

  CreateNewGroupUseCase({required this.repository});

  Future<void> call(
      MyChatEntity myChatEntity, List<String> selectUserList) async {
    return repository.createNewGroup(myChatEntity, selectUserList);
  }
}
