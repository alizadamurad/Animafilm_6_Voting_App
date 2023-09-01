import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  String cryptoPass =
      "0af09455e54028405805b397b6128c3d2ae06d99df0fe679058fedfff7934812";

  bool checkPass(String pass) {
    var byte = utf8.encode(pass);
    var hash = sha256.convert(byte);
    var hashString = hash.toString();

    return hashString == cryptoPass;
  }
}
