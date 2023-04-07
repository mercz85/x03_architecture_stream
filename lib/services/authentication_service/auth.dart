import 'package:firebase_auth/firebase_auth.dart';
import '../../features/authentication/bloc/auth_base.dart';

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //[authStream]
  @override
  Stream<String> get onAuthStateChanged {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => user?.uid as String);
  }

  @override
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential.user!.uid;
  }

  @override
  Future<String> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  String? currentUser() {
    User? user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
