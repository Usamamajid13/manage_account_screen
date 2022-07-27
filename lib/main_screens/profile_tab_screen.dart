import 'package:flutter/material.dart';
import 'package:manage_account_screen/constants.dart';

import '../App_utils.dart';

class ProfileTabScreen extends StatefulWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTabScreen> createState() => _ProfileTabScreenState();
}

class _ProfileTabScreenState extends State<ProfileTabScreen> {
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
                          padding: EdgeInsets.all(10),
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
                        Container(
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
                  SizedBox(
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
}
