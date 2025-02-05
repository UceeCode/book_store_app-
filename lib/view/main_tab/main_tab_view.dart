import 'package:book_store_app/common/color_extenstion.dart';
import 'package:book_store_app/view/home/home_view.dart';
import 'package:flutter/material.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with TickerProviderStateMixin{
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: 4,vsync: this);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
          children: [
            const HomeView(),
            Container(),
            Container(),
            Container(),
          ]
      ),
      bottomNavigationBar: BottomAppBar(color: TColor.primary,
        child: TabBar(
          controller: controller,
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          tabs:const [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.search ),
              text: "Search",
            ),
            Tab(
              icon: Icon(Icons.menu),
              text: "WishList",
            ),
            Tab(
              icon: Icon(Icons.shopping_bag),
              text: "Cart",
            ),

          ]),),
    );
  }
}
