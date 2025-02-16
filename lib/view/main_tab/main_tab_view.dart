import 'package:book_store_app/Review/review.dart';
import 'package:book_store_app/view/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:book_store_app/view/home/home_view.dart';
import 'package:book_store_app/view/our_book/out_books_view.dart'; // Corrected import
import 'package:book_store_app/view/search/search_view.dart';
import '../../Review/write_review_page.dart';
import '../../account/account_view.dart';
import '../../common/color_extenstion.dart';
import '../Wish/Wish_list_view.dart';


class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

GlobalKey<ScaffoldState> sideMenuScaffoldKey = GlobalKey<ScaffoldState>();

class _MainTabViewState extends State<MainTabView> with TickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  int selectMenu = 0;
  List menuArr = [
    {"name": "Home", "icon": Icons.home, "route": "/home"}, // Add route
    {"name": "Review", "icon": Icons.reviews, "route": "/review"}, // Add route (if you have a ReviewView)
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      key: sideMenuScaffoldKey,
      endDrawer: Drawer(
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: media.width * 0.8,
        child: Container(
          decoration: BoxDecoration(
            color: TColor.dColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(media.width * 0.7),
            ),
            boxShadow: const [BoxShadow(color: Colors.black54, blurRadius: 15)],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: menuArr.map((mObj) {
                    var index = menuArr.indexOf(mObj);
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      decoration: selectMenu == index
                          ? BoxDecoration(color: TColor.primary, boxShadow: [
                        BoxShadow(color: TColor.primary, blurRadius: 10, offset: const Offset(0, 3))
                      ])
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          if (index == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WriteReviewPage()),
                            );
                            sideMenuScaffoldKey.currentState?.closeEndDrawer();
                          } if (index == 2) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AccountView()),
                            );
                            sideMenuScaffoldKey.currentState?.closeEndDrawer();
                          }
                          setState(() {
                            selectMenu = index;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              mObj["name"].toString(),
                              style: TextStyle(
                                color: selectMenu == index ? Colors.white : TColor.text,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Icon(
                              mObj["icon"] as IconData? ?? Icons.home,
                              color: selectMenu == index ? Colors.white : TColor.primary,
                              size: 33,
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.settings,
                            color: TColor.subTitle,
                            size: 25,
                          )),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms",
                          style: TextStyle(color: TColor.subTitle, fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(width: 15),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Privacy",
                          style: TextStyle(color: TColor.subTitle, fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          const HomeView(),
          SearchView(),
          WishlistPage(initialItems: []),
          CartView(),
          AccountView(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller?.index ?? 0,
        onTap: (index) {
          controller?.animateTo(index);
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        backgroundColor: TColor.primary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "WishList",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
      ),

    );
  }
}
