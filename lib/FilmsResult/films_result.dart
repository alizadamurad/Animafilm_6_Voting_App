import 'package:animafilm_6/Controllers/cvs_file_converter.dart';
import 'package:animafilm_6/Controllers/film_controller.dart';
import 'package:animafilm_6/Homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilmsResult extends StatelessWidget {
  FilmsResult({Key? key}) : super(key: key);

  @override
  final CvsController cvsController = Get.find();
  final FilmController filmController = Get.find();

  Widget build(BuildContext context) {
    filmController.addFilms();
    var films = filmController.allFilms;
    films.sort((a, b) => (b.value.value).compareTo(a.value.value));
    return Stack(
      children: [
        SizedBox(
          height: Get.height,
          width: Get.width,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
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
                onTap: () => Get.to(() => HomePage()),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffEA98B0).withOpacity(0.5),
                        Color(0xffFFEFAB).withOpacity(0.5),
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
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 45,
                        color: Color(0xff9F647F),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    cvsController.generateCsvFile(films);
                  },
                  icon: Icon(
                    Icons.download,
                    size: 35,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Film",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                        fontSize: 50,
                        fontFamily: "AsapCondensed",
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Vote",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                        fontSize: 50,
                        fontFamily: "AsapCondensed",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: films.length,
                  itemBuilder: (context, index) {
                    final film = films[index];
                    final isTopFilm =
                        index == 0; // Check if it's the first element

                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xffFEC417),
                              Color(0xffEA98B0),
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  film.title,
                                  style: TextStyle(fontSize: 30),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      film.value.value.toString(),
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    isTopFilm
                                        ? Icon(
                                            Icons.emoji_events_rounded,
                                            color: Colors.yellow[600],
                                            size: 40,
                                          )
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
