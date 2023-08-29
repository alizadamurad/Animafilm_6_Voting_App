import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Class/film_class.dart';

class FilmController extends GetxController {
  // List<Film> filmler = [
  //   Film(titleAz: "Hedis", title: "Hadis", photoUrl: "hadisurl", value: 0.obs),
  //   Film(
  //       titleAz: "Horumcek-Adam",
  //       title: "Spider-man",
  //       photoUrl: "spider",
  //       value: 0.obs),
  //   Film(
  //       titleAz: "Demir-Adam",
  //       title: "Iron-man",
  //       photoUrl: "iron",
  //       value: 0.obs),
  // ];

  List<Film> allFilms = [];
  List<Film> bestShortAnimatedA = [
    Film(
        titleAz: "ÇaÇa",
        title: "ChaCha",
        photoUrl: "assets/images/covers/bestshortanimated/a/chacha.png",
        value: 0.obs),
    Film(
        titleAz: "Hidari",
        title: "Hidari",
        photoUrl: "assets/images/covers/bestshortanimated/a/hidari.jpg",
        value: 0.obs),
    Film(
        titleAz: "Şəfəq saçan səma altında",
        title: "Under This Luminous Sky",
        photoUrl:
            "assets/images/covers/bestshortanimated/a/under_this_luminous_sky.jpeg",
        value: 0.obs),
    Film(
        titleAz: "27",
        title: "27",
        photoUrl: "assets/images/covers/bestshortanimated/a/27.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Fizika",
        title: "Fiziks",
        photoUrl: "assets/images/covers/bestshortanimated/a/fiziks.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Sevgi şarları",
        title: "Love Bubbles",
        photoUrl: "assets/images/covers/bestshortanimated/a/love_bubbles.jpeg",
        value: 0.obs),
  ];
  List<Film> bestShortAnimatedB = [
    Film(
        titleAz: "Bapbalaca adam",
        title: "A Tiny Man",
        photoUrl: "assets/images/covers/bestshortanimated/b/a_tiny_man .jpeg",
        value: 0.obs),
    Film(
        titleAz: "Gecə",
        title: "La Notte",
        photoUrl: "assets/images/covers/bestshortanimated/b/la_notte.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Yengəc",
        title: "Crab",
        photoUrl: "assets/images/covers/bestshortanimated/b/crab.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Həvva",
        title: "Eeva",
        photoUrl: "assets/images/covers/bestshortanimated/b/eeva.png",
        value: 0.obs),
    Film(
        titleAz: "Hərbin sonu",
        title: "The End of War",
        photoUrl: "assets/images/covers/bestshortanimated/b/the_end_of_war.jpg",
        value: 0.obs),
  ];
  List<Film> bestShortAnimatedForChildrenA = [
    Film(
        titleAz: "Hər bir yerdə",
        title: "Everywhere",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/a/everwhere.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Konfetlər",
        title: "Caramelle",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/a/caramelle.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Mən qorxmuram!",
        title: "I'm not Afraid!",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/a/i'm_not_afraid.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Qlobbi əjdaha",
        title: "Globby the Dragon",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/a/globby_the_dragon.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Korvin",
        title: "Corvine",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/a/corvine.jpeg",
        value: 0.obs),
  ];
  List<Film> bestShortAnimatedForChildrenB = [
    Film(
        titleAz: "Atamla səyahət",
        title: "A Journey With My Dad",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/b/a_journey_with_my_dad.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Bacı olmaq",
        title: "To Be Sisters",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/b/to_be_sisters.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Sonrakı görüntü",
        title: "Afterimage",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/b/afterimage.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Kiçik bir səyahət",
        title: "A Tiny Voyage",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/b/a_tiny_voyage.jpeg",
        value: 0.obs),
    Film(
        titleAz: "İxtiraçı ata",
        title: "Inventing Father",
        photoUrl:
            "assets/images/covers/bestshortanimatedforchild/b/inventing_father.jpeg",
        value: 0.obs),
  ];
  List<Film> bestShortAzerbaijanAnimated = [
    Film(
        titleAz: "Fokus-pokus",
        title: "Hocus-Pokus",
        photoUrl:
            "assets/images/covers/bestshortstudentanimated/hokus_pokus.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Sirli meşə",
        title: "Mysterious Forest",
        photoUrl:
            "assets/images/covers/bestshortstudentanimated/mysterious forest.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Mavi",
        title: "Mavi",
        photoUrl: "assets/images/covers/bestshortstudentanimated/mavi.png",
        value: 0.obs),
    Film(
        titleAz: "Tələ",
        title: "The Trap",
        photoUrl: "assets/images/covers/bestshortstudentanimated/trap.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Boş yerlər",
        title: "Empty Spaces",
        photoUrl:
            "assets/images/covers/bestshortstudentanimated/empty_spaces.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Xəyalpərəst",
        title: "The Dreamer",
        photoUrl:
            "assets/images/covers/bestshortstudentanimated/the_dreamer.jpg",
        value: 0.obs),
    Film(
        titleAz: "Kitabın səsi",
        title: "The Voice of the Book",
        photoUrl:
            "assets/images/covers/bestshortstudentanimated/the_voice_of_book.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Fəsillər keçirdi...",
        title: "The Seasons were Passing...",
        photoUrl:
            "assets/images/covers/bestshortstudentanimated/fesiller_kecdi.jpeg",
        value: 0.obs),
    Film(
        titleAz: "İki yol",
        title: "Two Ways",
        photoUrl: "assets/images/covers/bestshortstudentanimated/iki_yol.png",
        value: 0.obs),
    Film(
        titleAz: "Pəncərə",
        title: "Window",
        photoUrl:
            "assets/images/covers/bestshortstudentanimated/the_window.png",
        value: 0.obs),
    Film(
        titleAz: "Qarabağ nağılı",
        title: "Karabakh Tale",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/qarabag nagili.jpeg",
        value: 0.obs),
    Film(
        titleAz: "Timid və ağacdələn",
        title: "Timid and the Woodpecker",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/timid_and_woodpecker.png",
        value: 0.obs),
    Film(
        titleAz: "Baharın oğurlanması",
        title: "Stolen Spring",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/baharin_ogurlanmasi.png",
        value: 0.obs),
    Film(
        titleAz: "\"The Half\" - Birdən ölsək",
        title: "The Half - Birdən Ölsək",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/birden_olsek.png",
        value: 0.obs),
    Film(
        titleAz: "Tülkü həccə gedir",
        title: "The Fox Goes on Hajj Pilgrimage",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/tulku_hecce_gedir.png",
        value: 0.obs),
    Film(
        titleAz: "Qavaldaş",
        title: "Gavaldash",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/qavaldas.png",
        value: 0.obs),
    Film(
        titleAz: "Nataraz",
        title: "Disbalance",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/disbalance.png",
        value: 0.obs),
    Film(
        titleAz: "Təhsil haqqı",
        title: "Right to Education",
        photoUrl:
            "assets/images/covers/bestshortazerbaijananimated/tehsil_haqqi.jpeg",
        value: 0.obs),
  ];
  void addFilms() {
    allFilms.clear();
    loadFilms(bestShortAnimatedA, "bestShortAnimatedA");
    loadFilms(bestShortAnimatedB, "bestShortAnimatedB");
    loadFilms(bestShortAnimatedForChildrenA, "bestShortAnimatedForChildrenA");
    loadFilms(bestShortAnimatedForChildrenB, "bestShortAnimatedForChildrenB");
    loadFilms(bestShortAzerbaijanAnimated, "bestShortAzerbaijanAnimated");
    allFilms.addAll(bestShortAnimatedA);
    allFilms.addAll(bestShortAnimatedB);
    allFilms.addAll(bestShortAnimatedForChildrenA);
    allFilms.addAll(bestShortAnimatedForChildrenB);
    allFilms.addAll(bestShortAzerbaijanAnimated);
    super.onInit();
  }

  final box = GetStorage();

  saveFilms(List<Film> filmler, String filmListName) {
    var mapFilms = filmler.map((e) => e.toJson()).toList();
    String jsonString = jsonEncode(mapFilms);
    box.write(filmListName, jsonString);
  }

  loadFilms(List<Film> filmler, String filmListName) async {
    var jsonString = box.read(filmListName);
    if (jsonString != null) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      filmler.clear();
      filmler.addAll(jsonData.map((e) => Film.fromJson(e)).toList());
    }
  }
}
