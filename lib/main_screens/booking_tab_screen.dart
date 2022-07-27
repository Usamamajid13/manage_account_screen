import 'package:flutter/material.dart';
import 'package:manage_account_screen/app_utils.dart';
import 'package:manage_account_screen/constants.dart';

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
