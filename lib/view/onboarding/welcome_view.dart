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
      backgroundColor: Colors.white, // White background for a clean look
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: EdgeInsets.symmetric(horizontal: 36), // Fixed padding value
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centering content vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // New Title
              Text(
                "Discover Your Next Great Read",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.primary,
                  fontSize: 36, // Modern large font size
                  fontWeight: FontWeight.w700, // Bold weight for a modern look
                ),
              ),
              SizedBox(height: media.height * 0.05), // Adjusted height for spacing

              // Additional description text
              Text(
                "Explore thousands of books from all genres. Whether you're into fiction, self-help, or history, we have something for you.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: TColor.primaryLight,
                  fontSize: 16, // A smaller font size for the description
                  fontWeight: FontWeight.w400, // Regular weight for the description
                  height: 1.5, // Line height for better readability
                ),
              ),
              SizedBox(height: media.height * 0.10), // Spacing between text and buttons

              // Sign In Button
              RoundButton(
                title: 'Sign in',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInView()),
                  );
                },
              ),
              SizedBox(height: 20),

              // Sign Up Button
              RoundButton(
                title: 'Create Account',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
