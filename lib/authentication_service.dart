import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:localeventsapp/Screens/Login/components/body.dart';
import 'package:localeventsapp/Screens/Signup/components/body.dart';
import 'model/Firebase_user.dart';


class AuthenticationService{

  final FirebaseAuth firebaseAuth;

  AuthenticationService(this.firebaseAuth);

  Stream<User> get authStateChanges => firebaseAuth.authStateChanges();

  // ignore: missing_return
  Future<String> signOut() async{
    await firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);
      return "Signed In!";
    } on FirebaseAuthException catch(e) {
      return e.message;
    }
  }
  // ignore: missing_return
  Future<String> signUp({String email, String password, String username}) async{
    try{
      await Firebase.initializeApp();
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
          email: signupEmailController.text,
          password: signupPasswordController.text);

      User updateUser = FirebaseAuth.instance.currentUser;
      updateUser.updateProfile(displayName: username);

      userSetup(signupUsernameController.text);

      return "Signed Up!";

    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
  }
}
