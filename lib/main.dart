import 'package:flutter/material.dart';
import 'package:manage_account_screen/main_screens/manage_profile_screen.dart';

import 'constants.dart';
import 'main_screens/bottom_navigation_bar_screen.dart';
import 'main_screens/splash_screen.dart';

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
      initialRoute: bottomNavigationBarScreenRoute,

      routes: {
        splashRoute: (context) => const SplashScreen(),
        bottomNavigationBarScreenRoute: (context) => const BottomNavigationBarScreen(),
        manageProfileScreenRoute: (context) => const ManageProfileScreen(),
      },
    );
  }
}
