import 'package:animafilm_6/Controllers/password_controller.dart';
import 'package:animafilm_6/FIlmsResult/films_result.dart';
import 'package:animafilm_6/FIlmsResult/glass_morphism.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassControl extends StatelessWidget {
  PassControl({Key? key}) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  final PasswordController passwordController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Image.asset(
            'assets/images/animafilm_six.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Get.height * 0.3,
                  width: Get.width * 0.85,
                  child: GlassMorphism(
                    blur: 7,
                    opacity: 0.6,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.lock,
                          size: 55,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            controller: textEditingController,
                            onChanged: (text) {
                              passwordController.checkPass(text)
                                  ? {
                                      Get.to(() => FilmsResult()),
                                      textEditingController.clear(),
                                      Get.focusScope?.unfocus(),
                                    }
                                  : null;
                            },
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                            obscureText: false,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
