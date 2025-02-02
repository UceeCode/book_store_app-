import 'package:book_store_app/common/color_extenstion.dart';
import 'package:book_store_app/common/common_widget/round_textfield.dart';
import 'package:flutter/material.dart';

import '../common/common_widget/round_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController txtCode =TextEditingController();
  TextEditingController txtEmail =TextEditingController();
  TextEditingController txtPassword =TextEditingController();
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
            crossAxisAlignment: CrossAxisAlignment.start,// Added 'child:' before Column
            children: [
              Text(
                "Sign In",
                style: TextStyle(
                  color: TColor.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
               const SizedBox(height: 15),
              RoundTextField(
                  controller: txtCode,
                  hintText: "Optional Group Special Code",
              ),
              const SizedBox(height: 15),
              RoundTextField(
                  controller: txtEmail,
                  hintText: "Email Address",
              ),
              const SizedBox(height: 15),
              RoundTextField(
                  controller: txtPassword,
                  hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 15),
              Row(children: [
                IconButton(onPressed: (){
                  setState(() {
                    isStay = !isStay;
                  });
                }, icon: Icon(isStay? Icons.check_box : Icons.check_box_outline_blank, color:isStay ? TColor.primary: TColor.subTitle.withOpacity(0.3),
                ),
                ),
                Text(
                  "Stay Logged In",
                  style: TextStyle(
                    color: TColor.subTitle.withOpacity(0.3),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Text(
                  "Forgot Your Password",
                  style: TextStyle(
                    color: TColor.subTitle.withOpacity(0.3),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              ),
              const SizedBox(height: 15),
              RoundLineButton(title: "Sign in", onPressed: (){})

            ],
          ),
        ),
      ),
    );
  }
}
