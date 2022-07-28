import 'package:flutter/material.dart';
import 'package:manage_account_screen/app_utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({Key? key}) : super(key: key);

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  DateTime? _selectedDay1;
  var utils = AppUtils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Client Name:",
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Phone Number:",
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "SMS Content:",
                  style: utils.mediumTextStyle(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 110,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.1)),
                child: const Text(
                  "Your account has been regitered for you, please click the Confirm button in the app to confirm your reservation. After confimation please clickthe Arrived* button to add you to the currentqueue it you arrive at the site.",
                  style: TextStyle(color: Color(0xff999FBE), fontSize: 13),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    : _selectedDay1!.month == 3
                                        ? "Mar ${_selectedDay1!.year}"
                                        : _selectedDay1!.month == 4
                                            ? "Apr ${_selectedDay1!.year}"
                                            : _selectedDay1!.month == 5
                                                ? "May ${_selectedDay1!.year}"
                                                : _selectedDay1!.month == 6
                                                    ? "June ${_selectedDay1!.year}"
                                                    : _selectedDay1!.month == 7
                                                        ? "July ${_selectedDay1!.year}"
                                                        : _selectedDay1!
                                                                    .month ==
                                                                8
                                                            ? "Aug ${_selectedDay1!.year}"
                                                            : _selectedDay1!
                                                                        .month ==
                                                                    9
                                                                ? "Sep ${_selectedDay1!.year}"
                                                                : _selectedDay1!
                                                                            .month ==
                                                                        10
                                                                    ? "Oct ${_selectedDay1!.year}"
                                                                    : _selectedDay1!.month ==
                                                                            11
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
                height: 10,
              ),
              SizedBox(
                child: TableCalendar(
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay1, day);
                  },
                  onDaySelected: (selectedDay1, focusedDay1) {
                    setState(() {});

                    _selectedDay1 = selectedDay1;
                  },
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: yellowColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(color: Colors.white),
                        )),
                    headerTitleBuilder: (context, date) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: yellowColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.month.toString(),
                          style: const TextStyle(color: Colors.white),
                        )),
                    todayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: yellowColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: const TextStyle(color: Colors.white),
                        )),
                  ),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _selectedDay1 ?? DateTime.now(),
                  headerVisible: false,
                  availableGestures: AvailableGestures.horizontalSwipe,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(color: Colors.orange),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Start Time",
                      style: utils.mediumTextStyle(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: utils.textFieldWithIcon(
                      context: context,
                      isObscure: false,
                      color: Colors.grey[300],
                      radius: 6.0,
                      height: 35.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selected1 = true;
                          selected2 = false;
                          selected3 = false;
                          setState(() {});
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
                        "Everyday",
                        style: utils.mediumTextStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selected1 = false;
                          selected2 = true;
                          selected3 = false;
                          setState(() {});
                        },
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  selected2 ? Colors.black : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Center(
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
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
                        "Weekday",
                        style: utils.mediumTextStyle(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selected1 = false;
                          selected2 = false;
                          selected3 = true;
                          setState(() {});
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
                                  color: selected3
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
                        "Weekend",
                        style: utils.mediumTextStyle(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              utils.bigButton(
                  containerColor: orangeColor,
                  text: "Add",
                  width: MediaQuery.of(context).size.width * 0.3,
                  textColor: Colors.white,
                  borderRadius: 7.0,
                  shadowColors: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
