import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import '../../../core/services/storage/storage_service.dart';

class AuthService {
  AuthService._();

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static bool _isGuest = false;

  static User? get currentUser => _auth.currentUser;

  static bool get isLoggedIn => currentUser != null;

  static bool get isGuest => _isGuest;

  static bool get isAuthenticated =>
      _isGuest || currentUser != null;

  static String get playerName {
    if (_isGuest) return 'Guest';

    return currentUser?.displayName ??
        currentUser?.email ??
        'Player';
  }

  static String? get photoUrl {
    if (_isGuest) return null;

    return currentUser?.photoURL;
  }

  static Future<void> continueAsGuest() async {
    _isGuest = true;

    await StorageService.setGuestMode(
      true,
    );

    debugPrint(
      'Guest login successful',
    );
  }

  static Future<User?> signInWithGoogle() async {
    try {
      debugPrint('Starting Google Sign-In...');

      final GoogleSignInAccount? googleUser =
      await _googleSignIn.signIn();

      if (googleUser == null) {
        debugPrint('User cancelled sign in');
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;

      final credential =
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(
        credential,
      );

      _isGuest = false;

      debugPrint(
        'Firebase login success: ${userCredential.user?.email}',
      );

      return userCredential.user;
    } catch (e, stackTrace) {
      debugPrint('==============================');
      debugPrint('GOOGLE SIGN IN ERROR');
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      debugPrint('==============================');

      rethrow;
    }
  }

  static Future<void> signOut() async {
    _isGuest = false;

    try {
      await _googleSignIn.signOut();
    } catch (_) {}

    await _auth.signOut();
  }
}