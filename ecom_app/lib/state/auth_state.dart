import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

class AuthState extends ChangeNotifier {
  final AuthService _auth = AuthService();
  bool get isSignedIn => _auth.isSignedIn;
  String? get uid => _auth.uid;

  Future<void> signInGuest() async {
    await _auth.signInAnonymously();
    notifyListeners();
  }

  Future<void> signOut() async {
    await _auth.signOut();
    notifyListeners();
  }
}
