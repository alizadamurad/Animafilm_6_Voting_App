import 'package:animafilm_6/Controllers/cvs_file_converter.dart';
import 'package:animafilm_6/Controllers/password_controller.dart';
import 'package:animafilm_6/Controllers/scroll_controller.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Controllers/film_controller.dart';
import 'Homepage/homepage.dart';

void main() async {
  await GetStorage.init();

  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        importance: NotificationImportance.High,
        channelKey: 'basic_channel',
        channelName: 'Csv Notification',
        channelDescription: 'Csv converted ! ',
      ),
    ],
  );
  Get.put(PasswordController());
  Get.put(CvsController());
  Get.put(FilmController());
  Get.put(MyScrollController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
