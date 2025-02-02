import 'package:flutter/material.dart';

import '../../common/color_extenstion.dart';

class welcomeView extends StatefulWidget {
  const welcomeView({super.key});

  @override
  State<welcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<welcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            "assets/img/welcome.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Container(
              width: media.width,
              padding: const EdgeInsets.symmetric(horizontal: 36), // Fixed padding value
              child: Column(
                children: [
                  SizedBox(height: media.width * 0.25),
                  Text(
                    "Books For\nEvery Taste.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.primary,
                      fontSize: 35 ,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: media.width * 0.28),
                   MaterialButton(
                     onPressed: (){},
                       textColor:  Colors.white,
                       color: TColor.primary,
                       height: 50,
                       minWidth: double.maxFinite,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                     child: Text("Sign in", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)
                   ),
                  const SizedBox(height: 20),
                  MaterialButton(
                      onPressed: (){},
                      textColor:  Colors.white,
                      color: TColor.primary,
                      height: 50,
                      minWidth: double.maxFinite,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      child: Text("Sign up", style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
