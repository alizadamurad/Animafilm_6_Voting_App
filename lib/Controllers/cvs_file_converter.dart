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
    // Map<Permission, PermissionStatus> statuses = await [
    //   Permission.storage,
    // ].request();

    List<List<dynamic>> rows = [];
    List<dynamic> empty = [];
    // Best Short Grand Prix A
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
    //Best Short Grand Prix B
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

    //Best Short For Children - A
    List<dynamic> rowbestShortAnimatedChildA = [];
    rows.add(empty);
    rowbestShortAnimatedChildA.add('Best Short Animated Film for Children - A');
    rowbestShortAnimatedChildA.add('Votes');
    rows.add(rowbestShortAnimatedChildA);
    filmController.bestShortAnimatedForChildrenA
        .sort((a, b) => a.title.compareTo(b.title));
    for (var film in filmController.bestShortAnimatedForChildrenA) {
      List<dynamic> row = [];
      row.add(film.title);
      row.add(film.value.value);
      rows.add(row);
    }
    //Best Short For Children - B
    List<dynamic> rowbestShortAnimatedChildB = [];
    rows.add(empty);
    rowbestShortAnimatedChildB.add('Best Short Animated Film for Children - B');
    rowbestShortAnimatedChildB.add('Votes');
    rows.add(rowbestShortAnimatedChildB);
    filmController.bestShortAnimatedForChildrenB
        .sort((a, b) => a.title.compareTo(b.title));
    for (var film in filmController.bestShortAnimatedForChildrenB) {
      List<dynamic> row = [];
      row.add(film.title);
      row.add(film.value.value);
      rows.add(row);
    }

    //Best Short Azerbaijan
    List<dynamic> rowbestShortAzerbaijan = [];
    rows.add(empty);
    rowbestShortAzerbaijan.add('Best Short Azerbaijani Animated Film');
    rowbestShortAzerbaijan.add('Votes');
    rows.add(rowbestShortAzerbaijan);
    filmController.bestShortAzerbaijanAnimated
        .sort((a, b) => a.title.compareTo(b.title));
    for (var film in filmController.bestShortAzerbaijanAnimated) {
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
    var status = await Permission.storage.request();

    ///getAplicationDocumentDirectory()

    Directory? dir;
    Platform.isAndroid == true
        ? dir = await getExternalStorageDirectory()
        : await getLibraryDirectory();

    if (status.isGranted) {
      if (dir != null) {
        directory = dir.path;

        DateTime dateTime = DateTime.now();
        String filePath =
            "${dir.path}/CSV_EXPORT_${DateTimeFormat.format(dateTime, format: 'M_j_H:i')}.csv";

        File f = File(filePath);

        await f.writeAsString(csv);
      }
    } else {
      print('ACCESS DENIED');
    }
  }

  String? directory;
}
