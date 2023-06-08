import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoolin/utils/colors.dart';
import 'package:shoolin/utils/dimesions.dart';
import 'Signin_text.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BackgroundImage(),
        Image(
        height: Dimensions.screenHeight * 0.35,
          fit: BoxFit.cover,
          image: AssetImage("assets/image/sign_in.png"),
        ),
            Center(
              child: Text(
                'Shoolin',
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SignInTextFields(),

          ],
        ),
      ),
    );
  }
}
