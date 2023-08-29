import 'package:animafilm_6/FilmsPage/films_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Class/film_class.dart';

class SeansWidget extends StatelessWidget {
  final String seansAz;
  final String seansEn;
  final List<Film> film;
  final String filmCategoryName;
  final String seansName;
  const SeansWidget({
    super.key,
    required this.film,
    required this.filmCategoryName,
    required this.seansName,
    required this.seansAz,
    required this.seansEn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 25),
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
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
          padding: const EdgeInsets.all(2.5),
          child: GestureDetector(
            onTap: () {
              Get.to(() => FilmsPage(
                    seansAz: seansAz,
                    seansEn: seansEn,
                    filmListName: filmCategoryName,
                    filmler: film,
                  ));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  seansName,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: "AsapCondensed",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
