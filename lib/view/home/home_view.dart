import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';
import '../../common/common_widget/best_seller_cell.dart';
import '../../common/common_widget/top_picks_cell.dart';

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

  List bestArr = [
    {
      "name": "The Forgotten Guardians",
      "author": "Daniel Taylor",
      "img": "assets/img/TheForgottenGuardians.jpg",
      "rating": 5.0
    },
    {
      "name": "The End of Loneliness",
      "author": "Benedict Wells",
      "img": "assets/img/TheEndOfLoneliness.webp",
      "rating": 4.0
    },
    {
      "name": "No More Lies",
      "author": "Kerry Lonsdale",
      "img": "assets/img/NoMoreLies.jpg",
      "rating": 3.0
    }
  ];

  List genArr = [
    {
      "name": "The Forgotten Guardians",
      "img": "assets/img/TheForgottenGuardians.jpg",
    },
    {
      "name": "The End of Loneliness",
      "img": "assets/img/TheEndOfLoneliness.webp",
    },
    {
      "name": "No More Lies",
      "img": "assets/img/NoMoreLies.jpg",
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
                        title: Row(children:  const [
                          Text(
                          "Our Top Picks",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                          ),
                        ]),
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
                      SizedBox(
                        width: media.width,
                        height: media.width * 0.8,
                        child: CarouselSlider.builder(
                          itemCount: topPickArr.length,
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                            var iObj = topPickArr[itemIndex] as Map? ?? {};
                            return TopPicksCell(iObj: iObj,);
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
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(children: [
                          Text(
                            "Bestsellers",
                            style: TextStyle(
                                color: TColor.text,
                                fontSize: 22,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: media.width * 0.9,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 8),
                            scrollDirection: Axis.horizontal,
                            itemCount: bestArr.length,
                            itemBuilder: ((context, index) {
                  var bObj = bestArr[index] as Map? ?? {};

                    return BestSellerCell( bObj: bObj,);
                            })),
                      ),
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
