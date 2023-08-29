import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  void notification() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.onInit();
  }
}
