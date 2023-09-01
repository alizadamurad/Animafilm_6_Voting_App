import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  String cryptoPass =
      "3ca8ec1fc6a140fe7d47caa6bcd78b544bf0cd95f8b8032838bfe1cbbcafb431";

  bool checkPass(String pass) {
    var byte = utf8.encode(pass);
    var hash = sha256.convert(byte);
    var hashString = hash.toString();

    return hashString == cryptoPass;
  }
}
