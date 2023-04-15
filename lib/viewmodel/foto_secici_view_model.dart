import 'dart:io';
import 'package:avukapp/service/firestore_db.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class FotoSeciciViewModel extends ChangeNotifier {
  File? secilenFoto;
  late String downloadUrl;
  Future<void> fromCamera(String userId) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      secilenFoto = File(pickedFile.path);
      notifyListeners();

      final fileName = '$userId.jpg';
      final url = await uploadImage(secilenFoto!, fileName);
      if (url != null) {
        await FirestoreDbService().updateUserProfileImageUrl(userId, url);
        downloadUrl = url;
      }
    }
  }

  Future<void> fromGallery(String userId) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      secilenFoto = File(pickedFile.path);
      notifyListeners();

      final fileName = '$userId.jpg';
      final url = await uploadImage(secilenFoto!, fileName);
      if (url != null) {
        await FirestoreDbService().updateUserProfileImageUrl(userId, url);
        downloadUrl = url;
      }
    }
  }

  Future<void> updateUserProfileImage(String userId, File secilenFoto) async {
    if (secilenFoto != null) {
      final fileName =
          '$userId.jpg'; // Kullanıcının ID'sini dosya adı olarak kullanın
      final url = await uploadImage(secilenFoto, fileName);
      if (url != null) {
        print('Fotoğraf yüklendi: $url');
        await FirestoreDbService().updateUserProfileImageUrl(userId, url);
        notifyListeners();
      } else {
        print('Fotoğraf yüklenemedi');
      }
    }
  }

  Future<String?> uploadImage(File imageFile, String fileName) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('images/$fileName');
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  void notifyListeners() {
    // Bu metot, ViewModel sınıfının bir değişiklik olduğunu bildirmesi için kullanılır.
    // Genellikle bir state management paketi (örn. Provider, BloC) kullanılarak
    // ViewModel sınıfının görünüm katmanı ile iletişim kurması sağlanır.
  }
}
