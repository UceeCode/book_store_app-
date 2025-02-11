import 'package:book_store_app/login/help_us_view.dart';
import 'package:book_store_app/login/sign_in_view.dart';
import 'package:flutter/material.dart';

import '../common/color_extenstion.dart';
import '../common/common_widget/round_button.dart';
import '../common/common_widget/round_textfield.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SignUpView> {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtCode = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  bool isStay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Added 'child:' before Column
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              RoundTextField(
                controller: txtEmail,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              RoundTextField(
                controller: txtPassword,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(height: 15),
              Row(children: [
                IconButton(onPressed: () {
                  setState(() {
                    isStay = !isStay;
                  });
                },
                  icon: Icon(
                    isStay ? Icons.check_box : Icons.check_box_outline_blank,
                    color: isStay ? TColor.primary : TColor.subTitle.withOpacity(0.3),
                  ),
                ),
                Expanded(child:
                Text(
                  "Please sign me up for the monthly newsletter.",
                  style: TextStyle(
                    color: TColor.subTitle.withOpacity(0.3),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ),
              ],
              ),
              const SizedBox(height: 15),
              RoundLineButton(
                  title: "Create Account",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInView()));
                  })

            ],
          ),
        ),
      ),
    );
  }
}