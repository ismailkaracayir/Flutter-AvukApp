import 'package:avukapp/lacator.dart';
import 'package:avukapp/model/user.dart';
import 'package:avukapp/repository/user_repository.dart';
import 'package:avukapp/service/auth_base.dart';
import 'package:flutter/material.dart';

enum ViewState { Idle, Busy }

class UserViewModel extends ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  final UserRepository _userRepository = getIt<UserRepository>();

  UserViewModel() {
    currentUser();
  }

  UserModel? _user;
  UserModel? get user => _user;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    debugPrint('viewstate tetiklendi');
    notifyListeners();
  }

  @override
  Future<UserModel> createWithUserEmailAndPass(
      String email, String pass) async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.createWithUserEmailAndPass(email, pass);
      return _user!;
    } catch (e) {
      debugPrint(
          'EMAİL İLE KAYIT OLMA USERVİEW_MODEL SORUN CIKTI ${e.toString()}');
      return UserModel(userID: null, email: null);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return user!;
    } catch (e) {
      debugPrint('viewmodel currentuser da hata cıktı ${e.toString()}');
      return UserModel(userID: null, email: null);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel> singINWithPhoneNumber() {
    // TODO: implement singINWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<UserModel> singInWithEmailAndPass(String email, String pass) async{
    try {
        state = ViewState.Busy;
        _user = await _userRepository.singInWithEmailAndPass(email, pass);
        debugPrint('USERROPOSİTORY EMAİL İLE KAYIT OLMA TETİKLENDİ');
        return user!;    
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel> singInWithGoogle()async {
   try {
      state = ViewState.Busy;
      _user = await _userRepository.singInWithGoogle();
      debugPrint('tetiklendi');
      return user!;
    } catch (e) {
      debugPrint('viewmodel googleilegiris  da hata cıktı ${e.toString()}');
      return UserModel(userID: null, email: null);
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> singOut() async{
    try {
      state = ViewState.Busy;
      bool temp = await _userRepository.singOut();
      _user = null;
      return temp;
    } catch (e) {
      debugPrint('viewmodel singOut da hata cıktı ${e.toString()}');
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }
}
