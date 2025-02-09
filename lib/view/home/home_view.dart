import 'package:book_store_app/common/common_widget/genres_cell.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';
import '../../common/common_widget/best_seller_cell.dart';
import '../../common/common_widget/recent_cell.dart';
import '../../common/common_widget/round_button.dart';
import '../../common/common_widget/round_textfield.dart';
import '../../common/common_widget/top_picks_cell.dart';
import '../../login/sign_up_view.dart';
import '../main_tab/main_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  List topPickArr = [
    {"name": "The Forgotten Guardians", "author": "Daniel Taylor", "img": "assets/img/TheForgottenGuardians.jpg"},
    {"name": "The End of Loneliness", "author": "Benedict Wells", "img": "assets/img/TheEndOfLoneliness.webp"},
    {"name": "No More Lies", "author": "Kerry Lonsdale", "img": "assets/img/NoMoreLies.jpg"}
  ];

  List bestArr = [
    {"name": "The Forgotten Guardians", "author": "Daniel Taylor", "img": "assets/img/TheForgottenGuardians.jpg", "rating": 5.0},
    {"name": "The End of Loneliness", "author": "Benedict Wells", "img": "assets/img/TheEndOfLoneliness.webp", "rating": 4.0},
    {"name": "No More Lies", "author": "Kerry Lonsdale", "img": "assets/img/NoMoreLies.jpg", "rating": 3.0}
  ];

  List genreArr = [
    {"name": "Graphic Novels", "img": "assets/img/TheForgottenGuardians.jpg"},
    {"name": "The End of Loneliness", "img": "assets/img/TheEndOfLoneliness.webp"},
    {"name": "Graphic Novels", "img": "assets/img/NoMoreLies.jpg"}
  ];

  List recentArr = [
    {"name": "Graphic Novels", "author": "Kerry Lonsdale", "img": "assets/img/TheForgottenGuardians.jpg"},
    {"name": "The End of Loneliness", "author": "Kerry Lonsdale", "img": "assets/img/TheEndOfLoneliness.webp"},
    {"name": "Graphic Novels", "author": "Kerry Lonsdale", "img": "assets/img/NoMoreLies.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: media.width * 0.1),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: Row(children: const [
                        Text(
                          "Our Top Picks",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                      leading: Container(),
                      leadingWidth: 1,
                      actions: [
                        IconButton(onPressed: () {
                          sideMenuScaffoldKey.currentState?.openEndDrawer();
                        }, icon: const Icon(Icons.menu))
                      ],
                    ),
                    SizedBox(
                      width: media.width,
                      height: media.width * 0.8,
                      child: CarouselSlider.builder(
                        itemCount: topPickArr.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          var iObj = topPickArr[itemIndex] as Map? ?? {};
                          return TopPicksCell(iObj: iObj);
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1,
                          enlargeCenterPage: true,
                          viewportFraction: 0.45,
                          enlargeFactor: 0.4,
                          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            _buildSectionTitle("Bestsellers"),
            SizedBox(
              height: media.width * 0.9,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: bestArr.length,
                itemBuilder: (context, index) {
                  var bObj = bestArr[index] as Map? ?? {};
                  return GestureDetector(
                    onTap: () {},
                    child: BestSellerCell(bObj: bObj),
                  );
                },
              ),
            ),
            _buildSectionTitle("Genres"),
            SizedBox(
              height: media.width * 0.6,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: genreArr.length,
                itemBuilder: (context, index) {
                  var bObj = genreArr[index] as Map? ?? {};
                  return GenresCell(bObj: bObj, bgColor: index % 2 == 0 ? TColor.color1 : TColor.color2);
                },
              ),
            ),
            SizedBox(height: media.width * 0.1),
            _buildSectionTitle("Recently Viewed"),
            SizedBox(
              height: media.width * 0.7,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var bObj = recentArr[index] as Map? ?? {};
                  return RecentCell(iObj: bObj);
                },
              ),
            ),
            SizedBox(height: media.width * 0.1),
            _buildSectionTitle("Monthly Newsletter"),
            _buildNewsletterForm(media),
            SizedBox(height: media.width * 0.1),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
            color: TColor.text, fontSize: 22, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildNewsletterForm(Size media) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(color: TColor.textbox.withOpacity(0.4), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Receive our monthly newsletter and receive updates on new stock, books and the occasional promotion.",
              style: TextStyle(
                color: TColor.subTitle,
                fontSize: 12,
              )),
          const SizedBox(height: 15),
          RoundTextField(controller: txtName, hintText: "Name"),
          const SizedBox(height: 15),
          RoundTextField(controller: txtEmail, hintText: "Email Address"),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MiniRoundButton(
                title: "Sign Up",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
