import 'package:animafilm_6/FilmsPage/components.dart';
import 'package:animafilm_6/VotePage/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Class/film_class.dart';

class FilmSelected extends StatelessWidget {
  final List<Film> film;
  final String filmListName;
  final String url;
  final String title;
  final String titleAz;
  final RxInt value;
  const FilmSelected({
    Key? key,
    required this.url,
    required this.title,
    required this.titleAz,
    required this.value,
    required this.film,
    required this.filmListName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: url,
      child: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              url,
              fit: BoxFit.cover,
            ),
          ),
          Scaffold(
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
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Get.height * 0.65,
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
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 70,
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
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
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
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
                                  fontSize: 30,
                                  color: Colors.brown,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(
                              const VerifyDialog(),
                            );
                            value.value++;
                            filmController.saveFilms(film, filmListName);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 10),
                                    blurRadius: 10,
                                  )
                                ]),
                            child: const Padding(
                              padding: EdgeInsets.all(2),
                              child: VoteButton(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VoteButton extends StatelessWidget {
  const VoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset("assets/icons/button_theme.png"),
        ),
        const Positioned(
          top: 25,
          left: 0,
          right: 0,
          child: Center(
            child: Text(
              "Səs ver / Vote",
              style: TextStyle(
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(2, 2),
                    blurRadius: 30,
                  )
                ],
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
                fontFamily: "Montserrat",
              ),
            ),
          ),
        ),
      ],
    );
  }
}
