import 'package:animafilm_6/Drawer/drawer.dart';
import 'package:animafilm_6/FilmsPage/components.dart';
import 'package:animafilm_6/Homepage/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Controllers/scroll_controller.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final MyScrollController scroll = Get.find();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController = ScrollController()
      ..addListener(() {
        scroll.setOffset(scrollController.offset);
      });
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/animafilm_six.png',
              ),
            ),
          ),
        ),
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
        Scaffold(
          key: scaffoldKey,
          drawer: MyDrawer(),
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: SvgPicture.asset(
                    "assets/icons/menu_icon.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
                backgroundColor: Colors.transparent,
                expandedHeight: MediaQuery.of(context).size.height * 0.6,
                // flexibleSpace: FlexibleSpaceBar(
                //   background: Container(),
                // ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Obx(
                    () => Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xffABCAA5),
                            blurRadius: scroll.newOffset.value > 150 ? 50 : 200,
                            blurStyle: scroll.newOffset.value > 150
                                ? BlurStyle.solid
                                : BlurStyle.normal,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          SeansWidget(
                            seansAz:
                                "Ən yaxşı qısametrajlı animasiya filmi - A",
                            seansEn: "Best Short Animated Film - A",
                            seansName:
                                "Ən yaxşı qısametrajlı animasiya filmi - A \nBest Short Animated Film - A",
                            film: filmController.bestShortAnimatedA,
                            filmCategoryName: "bestShortAnimatedA",
                          ),
                          SeansWidget(
                            seansAz:
                                "Ən yaxşı qısametrajlı animasiya filmi - B",
                            seansEn: "Best Short Animated Film - B",
                            seansName:
                                "Ən yaxşı qısametrajlı animasiya filmi - B \nBest Short Animated Film - B",
                            film: filmController.bestShortAnimatedB,
                            filmCategoryName: "bestShortAnimatedB",
                          ),
                          SeansWidget(
                            seansAz:
                                "Uşaqlar üçün ən yaxşı qısametrajlı animasiya filmi - A",
                            seansEn:
                                "Best Short Animated Film for Children - A",
                            seansName:
                                "Uşaqlar üçün ən yaxşı qısametrajlı animasiya filmi - A \nBest Short Animated Film for Children - A",
                            film: filmController.bestShortAnimatedForChildrenA,
                            filmCategoryName: "bestShortAnimatedForChildrenA",
                          ),
                          SeansWidget(
                            seansAz:
                                "Uşaqlar üçün ən yaxşı qısametrajlı animasiya filmi - B",
                            seansEn:
                                "Best Short Animated Film for Children - B",
                            seansName:
                                "Uşaqlar üçün ən yaxşı qısametrajlı animasiya filmi - B \nBest Short Animated Film for Children - B",
                            film: filmController.bestShortAnimatedForChildrenB,
                            filmCategoryName: "bestShortAnimatedForChildrenB",
                          ),
                          SeansWidget(
                            seansAz:
                                "Ən yaxşı  Azərbaycan qısametrajlı animasiya filmi",
                            seansEn: "Best Short Azerbaijani Animated Film",
                            seansName:
                                "Ən yaxşı  Azərbaycan qısametrajlı animasiya filmi \nBest Short Azerbaijani Animated Film",
                            film: filmController.bestShortAzerbaijanAnimated,
                            filmCategoryName: "bestShortAzerbaijanAnimated",
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
