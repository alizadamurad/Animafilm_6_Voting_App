import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyDialog extends StatelessWidget {
  const VerifyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color(0xffEA98B0),
                  Color(0xffFFEFAB),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                height: Get.height * 0.4,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    const Text(
                      "Səsiniz qeydə alındı!",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "AsapCondensed",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Divider(
                        thickness: 3,
                        color: Color(0xff2B3865),
                      ),
                    ),
                    const Text(
                      "Your vote has been accepted!",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: "AsapCondensed",
                      ),
                    ),
                    Lottie.asset(
                      repeat: false,
                      'assets/animations/animation_2.json',
                      width: 170,
                      height: 170,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: -40,
            bottom: -50,
            child: Image.asset("assets/images/rabbit_left.png"),
          ),
          Positioned(
            right: -30,
            top: -125,
            child: Image.asset("assets/images/rabbit_right.png"),
          ),
          Positioned(
            top: -50,
            left: 0,
            right: 0,
            child: Lottie.asset(
              'assets/animations/animation_1.json',
              repeat: false,
            ),
          ),
        ],
      ),
    );
  }
}
