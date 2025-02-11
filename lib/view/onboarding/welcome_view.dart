import 'package:book_store_app/common/common_widget/round_button.dart';
import 'package:book_store_app/login/sign_up_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extenstion.dart';
import '../../login/sign_in_view.dart';

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
                   RoundButton(title: 'Sign in', onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInView()));
                   },),
                  const SizedBox(height: 20),
                  RoundButton(title: 'Create Account', onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                  },),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
