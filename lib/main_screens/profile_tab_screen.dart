import 'package:flutter/material.dart';
import 'package:manage_account_screen/constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../app_utils.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
  bool selected1 = false;
  bool selected2 = false;
  var utils = AppUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Merchant Dashboard",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, manageProfileScreenRoute);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/dummy-profile.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down_sharp),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 100,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: greyColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Total Staffs",
                                  style: TextStyle(color: yellowColor),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "4",
                                  style: TextStyle(color: yellowColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 20, left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.withOpacity(0.2)),
                          child: Text(
                            "Note: \nHigh permissions are used to adding, editing and deleting of all user or information. Low permissions are only used to allow adding and editing all users or information as well as invite the client.",
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Staff List",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            addClientsDialog(MediaQuery.of(context).size.width);
                          },
                          child: Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                                color: orangeColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  "Add New Staff",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    color: greyColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No.",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Name",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Staff Time",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Permission",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Management",
                          style: utils.smallTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  utils.bookingDetailsProfileWidget(
                      context: context,
                      status: "High",
                      boxColor: orangeColor,
                      clientName: "Lily Liam",
                      number: "4",
                      time: "04/05/2022"),
                  utils.bookingDetailsProfileWidget(
                      context: context,
                      status: "Low",
                      boxColor: yellowColor,
                      clientName: "Jim Cook",
                      number: "3",
                      time: "04/05/2022"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Load more (0)",
                        style: utils.smallTextStyle(color: orangeColor),
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: const BoxDecoration(
                            color: orangeColor, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 10,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  addClientsDialog(width) {
    showGeneralDialog(
      context: context,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 20),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.white60.withOpacity(0.3),
          body: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: width > 400
                        ? MediaQuery.of(context).size.width * 0.42
                        : MediaQuery.of(context).size.width * 0.32,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width * 0.8,
                          height: 570,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Staff Name",
                                    style: utils.mediumTextStyle(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                utils.textFieldWithIcon(
                                  context: context,
                                  isObscure: false,
                                  color: Colors.grey[200],
                                  radius: 30.0,
                                  height: 40.0,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Start Date",
                                      style: utils.mediumTextStyle(),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          _selectedDay1 == null
                                              ? "Month"
                                              : _selectedDay1!.month == 1
                                                  ? "Jan ${_selectedDay1!.year}"
                                                  : _selectedDay1!.month == 2
                                                      ? "Feb ${_selectedDay1!.year}"
                                                      : _selectedDay1!.month ==
                                                              3
                                                          ? "Mar ${_selectedDay1!.year}"
                                                          : _selectedDay1!
                                                                      .month ==
                                                                  4
                                                              ? "Apr ${_selectedDay1!.year}"
                                                              : _selectedDay1!
                                                                          .month ==
                                                                      5
                                                                  ? "May ${_selectedDay1!.year}"
                                                                  : _selectedDay1!
                                                                              .month ==
                                                                          6
                                                                      ? "June ${_selectedDay1!.year}"
                                                                      : _selectedDay1!.month ==
                                                                              7
                                                                          ? "July ${_selectedDay1!.year}"
                                                                          : _selectedDay1!.month == 8
                                                                              ? "Aug ${_selectedDay1!.year}"
                                                                              : _selectedDay1!.month == 9
                                                                                  ? "Sep ${_selectedDay1!.year}"
                                                                                  : _selectedDay1!.month == 10
                                                                                      ? "Oct ${_selectedDay1!.year}"
                                                                                      : _selectedDay1!.month == 11
                                                                                          ? "Nov ${_selectedDay1!.year}"
                                                                                          : "Dec ${_selectedDay1!.year}",
                                          style: utils.mediumTextStyle(),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  child: TableCalendar(
                                    selectedDayPredicate: (day) {
                                      return isSameDay(_selectedDay1, day);
                                    },
                                    onDaySelected: (selectedDay1, focusedDay1) {
                                      setState(() {});

                                      Navigator.pop(context, true);
                                      _selectedDay1 = selectedDay1;

                                      addClientsDialog(width);
                                    },
                                    calendarBuilders: CalendarBuilders(
                                      selectedBuilder:
                                          (context, date, events) => Container(
                                              margin: const EdgeInsets.all(4.0),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: yellowColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Text(
                                                date.day.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                      headerTitleBuilder: (context, date) =>
                                          Container(
                                              margin: const EdgeInsets.all(4.0),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: yellowColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Text(
                                                date.month.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                      todayBuilder: (context, date, events) =>
                                          Container(
                                              margin: const EdgeInsets.all(4.0),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: yellowColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              child: Text(
                                                date.day.toString(),
                                                style: const TextStyle(
                                                    color: Colors.white),
                                              )),
                                    ),
                                    firstDay: DateTime.utc(2010, 10, 16),
                                    lastDay: DateTime.utc(2030, 3, 14),
                                    focusedDay: _selectedDay1 ?? DateTime.now(),
                                    headerVisible: false,
                                    availableGestures:
                                        AvailableGestures.horizontalSwipe,
                                    startingDayOfWeek: StartingDayOfWeek.monday,
                                    calendarStyle: const CalendarStyle(
                                      todayDecoration:
                                          BoxDecoration(color: Colors.orange),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Permission",
                                      style: utils.mediumTextStyle(),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        selected1 = true;
                                        selected2 = false;
                                        setState(() {});
                                        Navigator.pop(context);
                                        addClientsDialog(width);
                                      },
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.grey,
                                            )),
                                        child: Center(
                                          child: Container(
                                            width: 7,
                                            height: 7,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: selected1
                                                    ? Colors.black
                                                    : Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "High",
                                      style: utils.mediumTextStyle(),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        selected1 = false;
                                        selected2 = true;
                                        setState(() {});
                                        Navigator.pop(context);
                                        addClientsDialog(width);
                                      },
                                      child: Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.grey,
                                            )),
                                        child: Center(
                                          child: Container(
                                            width: 7,
                                            height: 7,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: selected2
                                                    ? Colors.black
                                                    : Colors.transparent,
                                                border: Border.all(
                                                  color: Colors.grey,
                                                )),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Low",
                                      style: utils.mediumTextStyle(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                utils.bigButton(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    containerColor: yellowColor,
                                    text: "Add Staff",
                                    width: width * 0.3,
                                    textColor: Colors.white,
                                    borderRadius: 7.0,
                                    shadowColors: Colors.white)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  DateTime? _selectedDay1;
}
