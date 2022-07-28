import 'package:flutter/material.dart';
import 'package:manage_account_screen/app_utils.dart';
import 'package:manage_account_screen/constants.dart';

class SignInScreenRoute extends StatefulWidget {
  const SignInScreenRoute({Key? key}) : super(key: key);

  @override
  State<SignInScreenRoute> createState() => _SignInScreenRouteState();
}

class _SignInScreenRouteState extends State<SignInScreenRoute> {
  bool obscureText = true;
  var utils = AppUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Welcome!",
              style: utils.extraLargeTextStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/loginImageOCI.png"),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Please enter your account here",
              style: utils.mediumTextStyle(),
            ),
            const SizedBox(
              height: 20,
            ),
            utils.textFieldWithIcon(
              context: context,
              color: lightGreyColor,
              isObscure: false,
              hintText: "Email or phone number",
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            utils.textFieldWithIcon(
              context: context,
              color: lightGreyColor,
              hintText: "Password",
              isObscure: obscureText,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.black.withOpacity(0.4),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                child: Icon(
                  Icons.remove_red_eye,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: utils.mediumTextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            utils.bigButton(
              onTap: () {
                Navigator.pushNamed(context, bottomNavigationBarScreenRoute);
              },
              width: MediaQuery.of(context).size.width * 0.9,
              borderRadius: 45.0,
              containerColor: yellowColor,
              shadowColors: Colors.white,
              height: 60.0,
              text: "Login",
              fontWeight: FontWeight.w400,
              textColor: greyColor,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, signUpScreenRoute);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: utils.mediumTextStyle(),
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: yellowColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
