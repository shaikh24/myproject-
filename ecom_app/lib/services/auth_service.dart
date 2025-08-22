import 'dart:async';

// Toggle Firebase Auth usage. Keep false for now so app runs without Firebase config.
const bool kEnableFirebaseAuth = false;

// Minimal placeholder auth service. When Firebase is enabled, replace with real implementation.
class AuthService {
  String? _uid;
  String? get uid => _uid;
  bool get isSignedIn => _uid != null;

  Future<void> signInAnonymously() async {
    _uid = 'guest';
  }

  Future<void> signOut() async {
    _uid = null;
  }
}
