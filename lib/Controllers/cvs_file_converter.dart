import 'dart:io';

import 'package:csv/csv.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'film_controller.dart';

final FilmController filmController = Get.find();

class CvsController extends GetxController {
  void generateCsvFile() async {
    filmController.loadFilms(
        filmController.bestShortAnimatedA, "bestShortAnimatedA");
    filmController.loadFilms(
        filmController.bestShortAnimatedB, "bestShortAnimatedB");
    filmController.loadFilms(filmController.bestShortAnimatedForChildrenA,
        "bestShortAnimatedForChildrenA");
    filmController.loadFilms(filmController.bestShortAnimatedForChildrenB,
        "bestShortAnimatedForChildrenB");
    filmController.loadFilms(filmController.bestShortAzerbaijanAnimated,
        "bestShortAzerbaijanAnimated");
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    List<List<dynamic>> rows = [];
    List<dynamic> empty = [];

    List<dynamic> rowbestShortA = [];
    rowbestShortA.add('Best Short Animated Film - GRAND PRIX - A');
    rowbestShortA.add('Votes');
    rows.add(rowbestShortA);
    filmController.bestShortAnimatedA
        .sort((a, b) => a.title.compareTo(b.title));
    for (var film in filmController.bestShortAnimatedA) {
      List<dynamic> row = [];
      row.add(film.title);
      row.add(film.value.value);
      rows.add(row);
    }
    List<dynamic> rowbestShortB = [];
    rows.add(empty);
    rowbestShortB.add('Best Short Animated Film - GRAND PRIX - B');
    rowbestShortB.add('Votes');
    rows.add(rowbestShortB);
    filmController.bestShortAnimatedB
        .sort((a, b) => a.title.compareTo(b.title));
    for (var film in filmController.bestShortAnimatedB) {
      List<dynamic> row = [];
      row.add(film.title);
      row.add(film.value.value);
      rows.add(row);
    }

    ///
    // row.add("Film");
    // row.add("Vote");
    // rows.add(row);
    // for (var film in films) {
    //   List<dynamic> row = [];
    //   row.add(film.title);
    //   row.add(film.value.value);
    //   rows.add(row);
    // }
    String csv = const ListToCsvConverter().convert(rows);

    ///getAplicationDocumentDirectory()

    Directory? dir;
    Platform.isAndroid == true
        ? dir = await getExternalStorageDirectory()
        : getDownloadsDirectory();

    print(dir);
    if (dir != null) {
      directory = dir.path;

      DateTime dateTime = DateTime.now();
      String filePath =
          "${dir.path}/CSV_EXPORT_${DateTimeFormat.format(dateTime, format: 'H:i')}.csv";

      File f = File(filePath);

      await f.writeAsString(csv);
    }
  }

  String? directory;
}
