import 'dart:io';

import 'package:csv/csv.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class CvsController extends GetxController {
  void generateCsvFile(films) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    List<List<dynamic>> rows = [];

    List<dynamic> row = [];

    row.add("Film");
    row.add("Vote");
    rows.add(row);
    for (var film in films) {
      List<dynamic> row = [];
      row.add(film.title);
      row.add(film.value.value);
      rows.add(row);
    }
    String csv = const ListToCsvConverter().convert(rows);

    Directory? dir = await getExternalStorageDirectory();
    print(dir);
    if (dir != null) {
      String filePath = "${dir.path}/newfile.csv";

      File f = File(filePath);

      await f.writeAsString(csv);
    }
  }
}
