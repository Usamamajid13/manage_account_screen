import 'package:flutter/material.dart';

import 'main_screens/bottom_navigation_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Manage Account',
      home: BottomNavigationBarScreen(),
    );
  }
}
