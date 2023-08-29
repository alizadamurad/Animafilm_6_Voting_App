import 'package:get/get.dart';

class Film {
  final String titleAz;
  final String title;
  final String photoUrl;
  final RxInt value;

  Film({
    required this.titleAz,
    required this.title,
    required this.photoUrl,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    return {
      "titleAz": titleAz,
      "title": title,
      "photoUrl": photoUrl,
      "value": value.value,
    };
  }

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      titleAz: json['titleAz'],
      title: json["title"],
      photoUrl: json["photoUrl"],
      value: RxInt(json["value"]),
    );
  }
}
