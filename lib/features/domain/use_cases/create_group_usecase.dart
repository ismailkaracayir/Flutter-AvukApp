import '../entities/group_entity.dart';
import '../repositories/firebase_repository.dart';

class GetCreateGroupUseCase {
  final FirebaseRepository repository;

  GetCreateGroupUseCase({required this.repository});

  Future<void> call(GroupEntity groupEntity) async {
    return await repository.getCreateGroup(groupEntity);
  }
}
