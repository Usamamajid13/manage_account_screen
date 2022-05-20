import 'package:flutter/material.dart';

import '../constants.dart';
import 'booking_tab_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            bottomNavigationBar: menu(context),
            body: const TabBarView(
              children: [
                BookingTabScreen(),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(null),
              ],
            )),
      ),
    );
  }
}
Widget menu(context) {
  return TabBar(
    indicatorColor: yellowColor,
    labelColor: yellowColor,
    unselectedLabelColor: Colors.grey,
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(color: yellowColor, width: 2.0),
      insets: EdgeInsets.fromLTRB(80.0, 0.0, 90.0, 40.0),
    ),
    tabs: [
      const Text(
          "Booking",
        ),
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: const Text(
          "Clients",
        ),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: const Text(
          "Email List",
          style: TextStyle(fontSize: 13),
        ),
      ),
      Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Icon(
            Icons.person,
          )),
    ],
  );
}
