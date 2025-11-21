import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _signedIn = false;

  bool get signedIn => _signedIn;

  Future<void> signIn(String username, String password) async {
    // TODO: implement actual auth logic
    await Future.delayed(const Duration(milliseconds: 500));
    _signedIn = true;
    notifyListeners();
  }

  void signOut() {
    _signedIn = false;
    notifyListeners();
  }
}
