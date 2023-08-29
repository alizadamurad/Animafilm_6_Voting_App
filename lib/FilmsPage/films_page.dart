import 'package:animafilm_6/Controllers/film_controller.dart';
import 'package:animafilm_6/FilmsPage/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Class/film_class.dart';

class FilmsPage extends StatelessWidget {
  final String seansEn;
  final String seansAz;
  final List<Film> filmler;
  final String filmListName;
  FilmsPage({
    Key? key,
    required this.filmler,
    required this.filmListName,
    required this.seansEn,
    required this.seansAz,
  }) : super(key: key);

  final FilmController filmController = Get.find();

  @override
  Widget build(BuildContext context) {
    filmController.loadFilms(filmler, filmListName);
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/animafilm_logoless.png',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: Get.height * 0.5,
            padding: const EdgeInsets.all(50),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Color(0xffb3cfae),
                  Color(0xffABCAA5),
                ],
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leadingWidth: 80,
            toolbarHeight: 80,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xffEA98B0).withOpacity(0.5),
                        const Color(0xffFFEFAB).withOpacity(0.5),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      height: 65,
                      width: 65,
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        size: 45,
                        color: Color(0xff9F647F),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      seansAz,
                      style: const TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            offset: Offset(2, 2),
                            color: Colors.black,
                          )
                        ],
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'AsapCondensed',
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 75),
                    child: Divider(
                      color: Color(0xffA32639),
                      thickness: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      seansEn,
                      style: const TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            offset: Offset(2, 2),
                            color: Colors.black,
                          )
                        ],
                        color: Colors.white,
                        fontSize: 28,
                        fontFamily: 'AsapCondensed',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: SizedBox(
                  height: 280,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: filmler.length,
                    itemBuilder: (context, index) {
                      final film = filmler[index];
                      return FilmWidget(
                        filmListName: filmListName,
                        film: filmler,
                        title: film.title,
                        titleAz: film.titleAz,
                        url: film.photoUrl,
                        value: film.value,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
