import 'package:animafilm_6/FIlmsResult/password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.6,
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xffC4D4B4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 35),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => PassControl());
                    },
                    child: Container(
                      height: 60,
                      width: Get.width * 0.55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffFEC417),
                            Color(0xffFFFFFF),
                            Color(0xffEA98B0),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2.5),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Center(
                                child: Text(
                                  "Qalib filmlər",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: "AsapCondensed",
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Icon(
                                  Icons.emoji_events_rounded,
                                  size: 35,
                                  color: Colors.yellow[800],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(
                  children: const [
                    Text(
                      "Əlaqə:",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xffD45B65),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Murad Əlizadə: 055 418 80 89\nEmail: elizademurad03@gmail.com",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xffD45B65),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Proqram tərtibatcısı: Murad Əlizadə\nDizayn: Xəyalə Zülfüqarova",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Color(0xffD45B65),
                        ),
                        textAlign: TextAlign.center,
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
