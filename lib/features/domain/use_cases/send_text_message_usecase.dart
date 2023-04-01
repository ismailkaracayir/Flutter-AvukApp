import '../entities/text_messsage_entity.dart';
import '../repositories/firebase_repository.dart';

class SendTextMessageUseCase {
  final FirebaseRepository repository;

  SendTextMessageUseCase({required this.repository});

  Future<void> call(
      TextMessageEntity textMessageEntity, String channelId) async {
    return await repository.sendTextMessage(textMessageEntity, channelId);
  }
}
