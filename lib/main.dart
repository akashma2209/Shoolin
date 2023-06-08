import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shoolin/log_in/login_page.dart';
import 'package:shoolin/sign_in/signin_page.dart';
import 'package:shoolin/verification/verify_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      home:LogInScreen(),
      //initialRoute: RouteHelper.mainFood,
     //getPages: RouteHelper.routes,
    );
  }
}