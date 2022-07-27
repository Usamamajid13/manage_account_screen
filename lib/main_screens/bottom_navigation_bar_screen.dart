import 'package:flutter/material.dart';
import 'package:manage_account_screen/main_screens/profile_tab_screen.dart';

import '../constants.dart';
import 'booking_client_screen.dart';
import 'booking_tab_screen.dart';
import 'email_list_tab_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
            bottomNavigationBar: menu(context),
            body: const TabBarView(
              children: [
                BookingTabScreen(),
                BookingClientScreen(),
                EmailListTabScreen(),
                ProfileTabScreen(),
              ],
            )),
      ),
    );
  }
}

Widget menu(context) {
  return SizedBox(
    height: 50,
    child: TabBar(
      indicatorColor: yellowColor,
      labelColor: yellowColor,
      unselectedLabelColor: Colors.grey,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: yellowColor, width: 2.0),
        insets: EdgeInsets.fromLTRB(80.0, 0.0, 90.0, 50.0),
      ),
      tabs: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: const Text(
            "Bookings",
          ),
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
    ),
  );
}
