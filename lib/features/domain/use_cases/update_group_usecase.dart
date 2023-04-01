import '../entities/group_entity.dart';
import '../repositories/firebase_repository.dart';

class UpdateGroupUseCase {
  final FirebaseRepository repository;

  UpdateGroupUseCase({required this.repository});
  Future<void> call(GroupEntity groupEntity) {
    return repository.updateGroup(groupEntity);
  }
}
