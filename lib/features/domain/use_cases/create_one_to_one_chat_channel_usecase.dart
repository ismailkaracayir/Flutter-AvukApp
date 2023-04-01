import '../entities/engage_user_entity.dart';
import '../repositories/firebase_repository.dart';

class CreateOneToOneChatChannelUseCase {
  final FirebaseRepository repository;

  CreateOneToOneChatChannelUseCase({required this.repository});

  Future<String> call(EngageUserEntity engageUserEntity) async {
    return repository.createOneToOneChatChannel(engageUserEntity);
  }
}
