import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  String cryptoPass =
      "a0e7471013fcdd135d6a805d51f606b818f79ed80a7db0e037f1dc495986952b";

  bool checkPass(String pass) {
    var byte = utf8.encode(pass);
    var hash = sha256.convert(byte);
    var hashString = hash.toString();

    return hashString == cryptoPass;
  }
}
