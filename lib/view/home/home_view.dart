import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List topPickArr = [
    {
      "name": "The Forgotten Guardians",
      "author": "Daniel Taylor",
      "img": "assets/img/TheForgottenGuardians.jpg"
    },
    {
      "name": "The End of Loneliness",
      "author": "Benedict Wells",
      "img": "assets/img/TheEndOfLoneliness.webp"
    },
    {
      "name": "No More Lies",
      "author": "Kerry Lonsdale",
      "img": "assets/img/NoMoreLies.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // Constrain the height to the screen height
          height: media.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    child: Transform.scale(
                      scale: 1.5,
                      origin: Offset(0, media.width * 0.8),
                      child: Container(
                        width: media.width,
                        height: media.width,
                        decoration: BoxDecoration(
                          color: TColor.primary,
                          borderRadius: BorderRadius.circular(media.width * 0.5),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: media.width * 0.1,),
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: const Text(
                          "Our Top Picks",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        centerTitle: false,
                        leading: Container(),
                        leadingWidth: 1,
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.menu),
                          )
                        ],
                      ),
                      // SizedBox(height: media.width * 0.1,),
                      Container(
                        width: media.width,
                        height: media.width * 0.8,
                        child: CarouselSlider.builder(
                          itemCount: topPickArr.length,
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                            var iObj = topPickArr[itemIndex] as Map? ?? {};
                            return Container(
                              width: media.width * 0.32 ,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black38,
                                          offset: Offset(0, 2),
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  iObj["img"].toString(),
                                  width: media.width * 0.3,
                                  height: media.width * 0.50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                                  ),
                              const SizedBox(height: 15,),
                                  Text(
                                    iObj["name"].toString(),
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: TColor.text,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    iObj["author"].toString(),
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: TColor.subTitle,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                            autoPlay: true,
                            aspectRatio: 1,
                            enlargeCenterPage: true,
                            viewportFraction: 0.45,
                            enlargeFactor: 0.4,
                            enlargeStrategy: CenterPageEnlargeStrategy.zoom ,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
