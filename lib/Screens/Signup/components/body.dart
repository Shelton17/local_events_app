import 'package:flutter/material.dart';
import 'package:localeventsapp/Screens/Login/login_screen.dart';
import 'package:localeventsapp/Screens/Signup/components/background.dart';
import 'package:localeventsapp/Screens/Signup/components/or_divider.dart';
import 'package:localeventsapp/components/already_have_an_account_acheck.dart';
import 'package:provider/provider.dart';
import '../../../authentication_service.dart';

final TextEditingController signupEmailController = TextEditingController();
final TextEditingController signupPasswordController = TextEditingController();
final TextEditingController signupUsernameController = TextEditingController();

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
             Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
                  radius: 60.0,
                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.grey[800],
              ),
            TextField(
              controller: signupUsernameController,
              decoration: InputDecoration(
                labelText: "Username",
                border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(height: 12,),
            TextField(
              controller: signupEmailController,
              decoration: InputDecoration(
                labelText: "Email",
                border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(height: 12,),
            TextField(
              controller: signupPasswordController,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signUp(
                  email: signupEmailController.text.trim(),
                  password: signupPasswordController.text.trim(),
                );
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("Sign Up"),
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            // RoundedButton(
            //   text: "Enter as Guest",
            //   textColor: Colors.white,
            //   press: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return HomePage();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}