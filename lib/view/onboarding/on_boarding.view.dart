import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int page = 0;
  PageController? controller = PageController();

  List pageArr = [
    {
      "title": "Discounted\nSecondhand Books",
      "sub_title": "Used and near new secondhand books at great prices.",
      "img": "assets/img/on_1.png"
    },
    {
      "title": "20 Book Grocers\nNationally",
      "sub_title": "We've successfully opened 20 stores across Australia.",
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
    // TODO: implement initState
    super.initState();

    controller?.addListener(() {
      page = controller?.page?.round() ?? 0;
      if (mounted) {
        setState(() {});
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child:
        Stack(children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index){
                var pObj = pageArr[index] as Map? ?? {};
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
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 15,),

                  Text(
                    pObj["sub_title"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primaryLight,
                        fontSize: 14,
                    ),
                  ),

                  SizedBox(
                    height: media.width * 0.25,
                  ),

                  Image.asset(
                    pObj["img"].toString(),
                    width: media.width * 0.8,
                    height:  media.width * 0.8,
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

              // Row(children: pageArr.map(toElement),)

              SizedBox(
                height: media.width * 0.15,
              ),


            ],
          )
        ],)
      ),
    );
  }
}
