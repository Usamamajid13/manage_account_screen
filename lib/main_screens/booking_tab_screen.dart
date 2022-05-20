import 'package:flutter/material.dart';
import 'package:manage_account_screen/constants.dart';

class BookingTabScreen extends StatefulWidget {
  const BookingTabScreen({Key? key}) : super(key: key);

  @override
  State<BookingTabScreen> createState() => _BookingTabScreenState();
}

class _BookingTabScreenState extends State<BookingTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                    Container(
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
                    const Icon(Icons.arrow_drop_down_sharp),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffA9ADC7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Booking",
                            style: TextStyle(color: yellowColor),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "4",
                            style: TextStyle(color: yellowColor),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Clients",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "4",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Total Staff",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "2",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
