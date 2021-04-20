import 'package:flutter/material.dart';
import 'package:localeventsapp/Screens/Login/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localeventsapp/ui/homepage/home_page.dart';
import 'package:provider/provider.dart';
import '../../../authentication_service.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            SizedBox(height:10.0),
            TextField(
              controller: passwordController,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15.0))
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Sign in"),
            ),
          ],
        ),
      ),
    );
  }
}
