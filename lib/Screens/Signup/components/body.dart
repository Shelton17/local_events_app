import 'package:flutter/material.dart';
import 'package:localeventsapp/Screens/Login/login_screen.dart';
import 'package:localeventsapp/Screens/Signup/components/background.dart';
import 'package:localeventsapp/Screens/Signup/components/or_divider.dart';
import 'package:localeventsapp/components/already_have_an_account_acheck.dart';
import 'package:localeventsapp/components/rounded_button.dart';
import 'package:localeventsapp/components/rounded_input_field.dart';
import 'package:localeventsapp/components/rounded_password_field.dart';
import 'package:localeventsapp/ui/homepage/home_page.dart';

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
            RoundedInputField(
              hintText: "First Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Last Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {},
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
            RoundedButton(
              text: "Enter as Guest",
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
