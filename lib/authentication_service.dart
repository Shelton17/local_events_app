import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthenticationService{
  final FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  Future<String> signOut() async{
    await firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed In!";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }
  Future<String> signUp({String email, String password}) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed Up!";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }
}