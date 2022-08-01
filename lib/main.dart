import 'package:flutter/material.dart';
import 'package:manage_account_screen/Authentication/sign_up_screen.dart';

import 'Authentication/sign_in_screen.dart';
import 'constants.dart';
import 'Authentication/splash_screen.dart';
import 'main_screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manage Account',
      initialRoute: splashRoute,
      routes: {
        splashRoute: (context) => const SplashScreen(),
        bottomNavigationBarScreenRoute: (context) =>
            const BottomNavigationBarScreen(),
        manageProfileScreenRoute: (context) => const ManageProfileScreen(),
        signInScreenRoute: (context) => const SignInScreenRoute(),
        signUpScreenRoute: (context) => const SignUpScreen(),
        addClientScreenRoute: (context) => const AddClientScreen(),
        editBookingScreenRoute: (context) => const EditBookingScreen(),
      },
    );
  }
}
