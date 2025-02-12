import 'package:book_store_app/view/onboarding/welcome_view.dart';
import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int page = 0;
  PageController controller = PageController();

  List<Map<String, String>> pageArr = [
    {
      "title": "WELCOME TO MY BOOK STORE",
      "sub_title": "Used and new secondhand books at great prices.",
      "img": "assets/img/on_1.png"
    },
    {
      "title": "20 Book Stores Nationally",
      "sub_title": "We've successfully opened 20 stores across Nigeria.",
      "img": "assets/img/on_2.png"
    },
    {
      "title": "Sell or Recycle Your Old\nBooks With Us",
      "sub_title":
      "If you're looking to downsize, sell or recycle old books, the Book Grocer can help.",
      "img": "assets/img/on_3.png"
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (mounted) {
        setState(() {
          page = controller.page?.round() ?? 0;
        });
      }
    });
  }

  void goToNextPage() {
    if (page < pageArr.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void skipToLastPage() {
    controller.jumpToPage(pageArr.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index];
                return Container(
                  width: media.width,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                  child: Column(
                    children: [
                      Text(
                        pObj["title"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: TColor.primary,
                            fontSize: 27,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        pObj["sub_title"].toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: TColor.primaryLight,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: media.width * 0.25),
                      Image.asset(
                        pObj["img"].toString(),
                        width: media.width * 0.8,
                        height: media.width * 0.8,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // To align TextButton and dots
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context
                              ) => const welcomeView()));
                        }, // Skip to last page
                        child: Text(
                          "Skip",
                          style: TextStyle(
                              color: TColor.primary,fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageArr.asMap().entries.map((entry) {
                          int index = entry.key;
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: page == index ? TColor.primary : TColor.primaryLight,
                              borderRadius: BorderRadius.circular(7.5),
                            ),
                          );
                        }).toList(),
                      ),
                      TextButton(
                        onPressed: () {
                          if(page < 2) {
                              page = page + 1;
                              controller.jumpToPage(page);
                          }else {
                            Navigator.push(context, MaterialPageRoute(builder: (context
                            ) => const welcomeView()));
                          }
                        }, // Go to the next page
                        child: Text(
                          "Next",
                          style: TextStyle(
                              color: TColor.primary, fontSize: 17,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.15), // Correct position for bottom space
              ],
            ),
          ],
        ),
      ),
    );
  }
}
