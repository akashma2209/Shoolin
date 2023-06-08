import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoolin/utils/colors.dart';
import 'package:shoolin/utils/dimesions.dart';
import 'login_text.dart';
import 'button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

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
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: Dimensions.font26 * 1.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height:Dimensions.height20),
            LogInTextFields(),
            LogInButtons(),
          ],
        ),
      ),
    );
  }
}
