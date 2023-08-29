import 'package:get/get.dart';

class MyScrollController extends GetxController {
  var newOffset = 0.0.obs;
  void setOffset(offset) {
    newOffset.value = offset;
  }
}
