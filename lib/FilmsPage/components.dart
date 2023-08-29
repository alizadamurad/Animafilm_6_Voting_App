import 'package:animafilm_6/Controllers/film_controller.dart';
import 'package:animafilm_6/VotePage/film_selected.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Class/film_class.dart';

final FilmController filmController = Get.find();

class FilmWidget extends StatelessWidget {
  final List<Film> film;
  final String filmListName;
  final String title;
  final String titleAz;
  final String url;
  final RxInt value;
  const FilmWidget(
      {Key? key,
      required this.title,
      required this.titleAz,
      required this.url,
      required this.value,
      required this.film,
      required this.filmListName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => FilmSelected(
              filmListName: filmListName,
              film: film,
              value: value,
              titleAz: titleAz,
              title: title,
              url: url,
            ));
        // value.value++;
        // filmController.saveFilms(film, filmListName);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-10, 0),
                    blurRadius: 15,
                    color: Colors.black26,
                  ),
                  BoxShadow(
                    offset: Offset(0, -10),
                    blurRadius: 15,
                    color: Colors.black26,
                  ),
                  BoxShadow(
                    offset: Offset(10, 0),
                    blurRadius: 15,
                    color: Colors.black26,
                  ),
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 15,
                    color: Colors.black26,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffFEC417),
                    Color(0xffFFFFFF),
                    Color(0xffEA98B0),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Hero(
                      tag: url,
                      child: SizedBox(
                        height: 400,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            url,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -90,
            child: Center(
              child: Column(
                children: [
                  Text(
                    titleAz,
                    style: const TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          offset: Offset(3, 3),
                          color: Colors.grey,
                        )
                      ],
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            offset: Offset(2, 2),
                            color: Colors.black26,
                          )
                        ],
                        fontFamily: "Montserrat",
                        fontSize: 20,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Padding(
    );
  }
}
