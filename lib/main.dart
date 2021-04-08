import 'package:flutter/material.dart';
import 'package:localeventsapp/Screens/Login/login_screen.dart';
import 'package:localeventsapp/Screens/Welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'authentication_service.dart';
import 'ui/homepage/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),

        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        title: 'TuLink Tester',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          primaryColor: Colors.purple,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

  class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final firebaseUser = context.watch<User>();

  if(firebaseUser != null){
  return HomePage();
  }
  return WelcomeScreen();

  }
  }