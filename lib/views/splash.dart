import 'dart:async';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/views/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      (){
        // moving to onboard
        gotoAndReplace(OnboardingScreen(), context);
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 80,
          mainAxisAlignment: MainAxisAlignment.center,


          children: [
            
            // app logo
      Image.asset(AppImages.appLogoVertical, height: 200.h, width: 200.w,),
           
           
           
            // spinner
        
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}