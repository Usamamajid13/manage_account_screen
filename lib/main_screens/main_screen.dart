import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:manage_account_screen/app_utils.dart';
import 'package:table_calendar/table_calendar.dart';

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

class BookingClientScreen extends StatefulWidget {
  const BookingClientScreen({Key? key}) : super(key: key);

  @override
  State<BookingClientScreen> createState() => _BookingClientScreenState();
}

class _BookingClientScreenState extends State<BookingClientScreen> {
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
                      const Text(
                        "1",
                        style: TextStyle(color: Colors.red),
                      ),
                      const Icon(
                        Icons.notifications,
                        color: Colors.yellow,
                      ),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
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
                              "Arrived Clients",
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Confirmed Clients",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "4",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Total Clients",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "2",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: bluishGreyColor),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search clients name/status",
                                hintStyle: utils.mediumTextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: orangeColor,
                          ),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: greyColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Clients List",
                          style: utils.mediumTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  utils.clientListWidget(
                      context: context,
                      image: const AssetImage(
                        "assets/dummy-profile.png",
                      ),
                      text: "AAA",
                      onTap: () {
                        sendEmailDialog(context);
                      }),
                  utils.clientListWidget(
                      context: context,
                      image: const AssetImage(
                        "assets/dummy-profile.png",
                      ),
                      text: "Loren Spears",
                      onTap: () {
                        sendEmailDialog(context);
                      }),
                  utils.clientListWidget(
                      context: context,
                      image: const AssetImage(
                        "assets/dummy-profile.png",
                      ),
                      text: "James Mila",
                      onTap: () {
                        sendEmailDialog(context);
                      }),
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

  sendEmailDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: SizedBox(
                height: 450,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: lighOrangeColor,
                        ),
                        child: const Center(
                          child: Text(
                            "Wed 10:23 AM",
                            style: TextStyle(color: orangeColor, fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              "To:",
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[300],
                            ),
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              "Subject:",
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[300],
                            ),
                            width: MediaQuery.of(context).size.width * 0.50,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const SizedBox(
                            width: 60,
                            child: Text(
                              "Content:",
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.grey[300],
                            ),
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: 150,
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 70,
                          ),
                          Image.asset(
                            "assets/camera.png",
                            scale: 26,
                          ),
                          Image.asset(
                            "assets/image-gallery.png",
                            scale: 26,
                          ),
                          Image.asset(
                            "assets/happiness.png",
                            scale: 26,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: seaGreenColor,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              width: 100,
                              height: 40,
                              margin: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Send",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 1.5,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class BookingTabScreen extends StatefulWidget {
  const BookingTabScreen({Key? key}) : super(key: key);

  @override
  State<BookingTabScreen> createState() => _BookingTabScreenState();
}

class _BookingTabScreenState extends State<BookingTabScreen> {
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
                      const Text(
                        "1",
                        style: TextStyle(color: Colors.red),
                      ),
                      const Icon(
                        Icons.notifications,
                        color: Colors.yellow,
                      ),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
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
                              "Total Booking",
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Total Clients",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "4",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Total Staff",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "2",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Booking List",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, addClientScreenRoute);
                          },
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: orangeColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "Add New Client",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 25,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: greyColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "No.",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Client Name",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Time of Booking",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Status",
                          style: utils.smallTextStyle(),
                        ),
                        Text(
                          "Managment",
                          style: utils.smallTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  utils.bookingDetailsWidget(
                    context: context,
                    status: "Waiting",
                    boxColor: orangeColor,
                    clientName: "Jack Liam",
                    number: "4",
                    time: "04/05/2022 15:00",
                    onTap: () {
                      Navigator.pushNamed(context, editBookingScreenRoute);
                    },
                  ),
                  utils.bookingDetailsWidget(
                    context: context,
                    status: "Completed",
                    boxColor: Colors.grey,
                    clientName: "Harry Jim",
                    number: "2",
                    time: "04/05/2022 11:30",
                    onTap: () {
                      Navigator.pushNamed(context, editBookingScreenRoute);
                    },
                  ),
                  utils.bookingDetailsWidget(
                    context: context,
                    status: "Completed",
                    boxColor: Colors.grey,
                    clientName: "Jack Liam",
                    number: "1",
                    time: "04/05/2022 11:00",
                    onTap: () {
                      Navigator.pushNamed(context, editBookingScreenRoute);
                    },
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
}

class EditBookingScreen extends StatefulWidget {
  const EditBookingScreen({Key? key}) : super(key: key);

  @override
  State<EditBookingScreen> createState() => _EditBookingScreenState();
}

class _EditBookingScreenState extends State<EditBookingScreen> {
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  DateTime? _selectedDay1;
  int bigButton = -1;
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
                  "Status",
                  style: utils.mediumTextStyle(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      bigButton = 1;
                      setState(() {});
                    },
                    child: Container(
                      height: 90,
                      width: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: bigButton == 1
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.transparent,
                              width: 2),
                          color: lighPurpleColor),
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: const Text(
                          "Waiting",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bigButton = 2;
                      setState(() {});
                    },
                    child: Container(
                      height: 90,
                      width: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: bigButton == 2
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.transparent,
                              width: 2),
                          color: lighBlueColor),
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: const Text(
                          "Confirm",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bigButton = 3;
                      setState(() {});
                    },
                    child: Container(
                      height: 90,
                      width: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: bigButton == 3
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.transparent,
                              width: 2),
                          color: lighGreenColor),
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: const Text(
                          "Complete",
                          style: TextStyle(color: Colors.white, fontSize: 12.2),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bigButton = 4;
                      setState(() {});
                    },
                    child: Container(
                      height: 90,
                      width: 80,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: bigButton == 4
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.transparent,
                              width: 2),
                          color: lighBrownColor),
                      child: Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: const Text(
                          "Empty",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
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
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Center(
                            child: Container(
                              width: 7,
                              height: 7,
                              decoration: BoxDecoration(
                                  color: selected2
                                      ? Colors.black
                                      : Colors.transparent,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  utils.bigButton(
                      containerColor: orangeColor,
                      text: "Invitation",
                      onTap: () {
                        Navigator.pop(context);
                      },
                      width: MediaQuery.of(context).size.width * 0.3,
                      textColor: Colors.white,
                      borderRadius: 7.0,
                      shadowColors: Colors.white),
                  utils.bigButton(
                      containerColor: orangeColor,
                      text: "Edited",
                      onTap: () {
                        Navigator.pop(context);
                      },
                      width: MediaQuery.of(context).size.width * 0.3,
                      textColor: Colors.white,
                      borderRadius: 7.0,
                      shadowColors: Colors.white),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class EmailListTabScreen extends StatefulWidget {
  const EmailListTabScreen({Key? key}) : super(key: key);

  @override
  State<EmailListTabScreen> createState() => _EmailListTabScreenState();
}

class _EmailListTabScreenState extends State<EmailListTabScreen> {
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
                      const Text(
                        "1",
                        style: TextStyle(color: Colors.red),
                      ),
                      const Icon(
                        Icons.notifications,
                        color: Colors.yellow,
                      ),
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 100,
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
                              "Total Inbox",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "4",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Total Sent",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "4",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Total Clients",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "2",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: bluishGreyColor),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search clients name",
                                hintStyle: utils.mediumTextStyle(
                                  color: Colors.grey,
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: orangeColor,
                          ),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    color: greyColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Email List",
                          style: utils.mediumTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  utils.emailListWidget(
                      name: "AAA",
                      context: context,
                      email: "usa**@gmail.com",
                      onTap: () {
                        emailListDialog(MediaQuery.of(context).size.width);
                      },
                      time: "12:00 AM"),
                  utils.emailListWidget(
                      name: "AAA",
                      context: context,
                      email: "usa**@gmail.com",
                      onTap: () {
                        emailListDialog(MediaQuery.of(context).size.width);
                      },
                      time: "12:00 AM"),
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

  emailListDialog(width) {
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
                        ? MediaQuery.of(context).size.width * 0.62
                        : MediaQuery.of(context).size.width * 0.52,
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
                          height: 470,
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
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: width * 0.9,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Jake Liam:",
                                            style: utils.smallTextStyle(),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: Colors.orange
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              "Wed 12:22 AM",
                                              style: utils.extraSmallTextStyle(
                                                  color: Colors.orange),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "The email found you well \n I'm wondering about... \n \nBest Regards,",
                                        style: utils.smallTextStyle(),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: width * 0.9,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Merchant",
                                            style: utils.smallTextStyle(),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: Colors.orange
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              "Wed 12:22 AM",
                                              style: utils.extraSmallTextStyle(
                                                  color: Colors.orange),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Thanks for your email. \nyour booking is... \n \nBest Regards,",
                                        style: utils.smallTextStyle(),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  width: width * 0.9,
                                  height: 110,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.grey.withOpacity(0.1),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Jake Liam:",
                                            style: utils.smallTextStyle(),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 3),
                                            decoration: BoxDecoration(
                                              color: Colors.orange
                                                  .withOpacity(0.4),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Text(
                                              "Wed 12:22 AM",
                                              style: utils.extraSmallTextStyle(
                                                  color: Colors.orange),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Got it.\n \n \nCheers,",
                                        style: utils.smallTextStyle(),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    utils.bigButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        containerColor: yellowColor,
                                        text: "Delete",
                                        width: width * 0.2,
                                        textColor: greyColor,
                                        borderRadius: 4.0,
                                        fontSize: 13,
                                        shadowColors: Colors.white),
                                    utils.bigButton(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        containerColor: yellowColor,
                                        text: "Reply",
                                        width: width * 0.2,
                                        textColor: greyColor,
                                        borderRadius: 4.0,
                                        fontSize: 13,
                                        shadowColors: Colors.white)
                                  ],
                                )
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
}

class ManageProfileScreen extends StatefulWidget {
  const ManageProfileScreen({Key? key}) : super(key: key);

  @override
  State<ManageProfileScreen> createState() => _ManageProfileScreenState();
}

class _ManageProfileScreenState extends State<ManageProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Manage the Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.grey[600]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Text(
                        "Name:",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              hintText: "Smith",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Text(
                        "Password:",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            obscureText: true,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              hintText: "*******",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Text(
                        "Confirm \nPassword:",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            obscureText: true,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              hintText: "*******",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Text(
                        "Phone No:",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              hintText: "042121214",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Text(
                        "Post Code:",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              hintText: "7005",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Text(
                        "Email:",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              hintText: "Smith@gmail.com",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Text(
                        "ABN:",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          padding: const EdgeInsets.only(left: 20),
                          child: const TextField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                              ),
                              hintText: "101-1117",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 190,
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Upload ABN authority document",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        height: 1,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: const Center(
                    child: Text(
                      "Save",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "By clicking sign up you agree to the following",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      child: Column(
                        children: [
                          const Text(
                            "Terms and Conditions",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            height: 1,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
