import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingService {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('*********************İzin verildi');
    } else {
      print('******************İzin verilmedi');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Bildirim alındı: ${message.notification!.title}');
      // Bildirimi işleme kodu...
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Uygulama açıldı: ${message.notification!.title}');
      // Uygulama açıldığında bildirimi işleme kodu...
    });
  }
}
