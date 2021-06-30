import 'package:firebase_auth/firebase_auth.dart';

class UserDetail {
  UserDetail({required this.uid});
  final String? uid;
}

abstract class AuthBase {
  Stream<UserDetail?> get onAuthStateChanged;
  Future<UserDetail?> currentUser();
  Future<UserDetail?> signInAnonymously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  UserDetail? _userFromFirebase(User? user) {
    // ignore: unnecessary_null_comparison
    if (user == null) {
      return null;
    }
    return UserDetail(uid: user.uid);
  }

  @override
  Stream<UserDetail?> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  @override
  Future<UserDetail?> currentUser() async {
    final user = _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  @override
  Future<UserDetail?> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user!);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
