import 'package:flutter/material.dart';
import '../../common/color_extenstion.dart';
import '../common/common_widget/your_review_row.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  List purArr = [
    "assets/img/NoMoreLies.jpg",
    "assets/img/NoMoreLies.jpg",
    "assets/img/NoMoreLies.jpg"
  ];

  List sResultArr = [
    {
      "img": "assets/img/NoMoreLies.jpg",
      "description": "A must read for everybody. This book taught me so many things about...",
      "rate": 5.0
    },
    {
      "img": "assets/img/NoMoreLies.jpg",
      "description": "#1 international bestseller and award winning history book.",
      "rate": 4.0
    }
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
            AppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false, // Removes the back icon
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: TColor.primary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Will Newman",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Constantly travelling and keeping up to date with business related books.",
                          style: TextStyle(color: TColor.subTitle, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image.asset(
                      "assets/img/NoMoreLies.jpg",
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.near_me_sharp,
                    color: TColor.subTitle,
                    size: 15,
                  ),
                  Expanded(
                    child: Text(
                      "Lagos - Nigeria",
                      style: TextStyle(color: TColor.subTitle, fontSize: 13),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Edit Profile', style: TextStyle(fontSize: 12)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Text(
                "Your purchases (10)",
                style: TextStyle(
                    color: TColor.subTitle,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: sResultArr.length,
              itemBuilder: (context, index) {
                var rObj = sResultArr[index] as Map? ?? {};
                return YourReviewRow(sObj: rObj);
              },
            ),
          ],
        ),
      ),
    );
  }
}
