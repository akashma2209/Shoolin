import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoolin/sign_in/signin_page.dart';


class VerifyButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            InkWell(
              onTap: () {},
              child: Text('Forget Password?'),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Get.to(()=>SignInScreen());
              },
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
