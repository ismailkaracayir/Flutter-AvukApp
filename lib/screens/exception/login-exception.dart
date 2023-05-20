// ignore: file_names
import 'package:flutter/material.dart';

class LoginException {
  static String exception(String hataCode) {
    debugPrint('EXCEPTİON DOSYASINA GELEN HATA $hataCode');
    switch (hataCode) {
      case '[firebase_auth/email-already-in-use] The email address is already in use by another account.':
        return "Bu mail Adresi zaten kullanımda farklı bir email adresi ile deneyiniz...";
      case '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.':
        return "Kayıtlı Böyle Bir Kullanıcı Bulunamadı...";
      case '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.':
        return "Lütfen Şifrenizi Kontrol Ediniz...";

      default:
        return "Bilinmeyen Bir Hata Oluştu";
    }
  }
}
