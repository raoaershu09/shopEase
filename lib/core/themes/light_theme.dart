import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  fontFamily:  "Lato",
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: AppColors.iconColor,
  ),


  // input field theme

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: AppColors.primaryColor.withOpacity(0.7)
    )
    ),


    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: AppColors.primaryColor.withOpacity(0.7)
    )
    ),


    focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: AppColors.primaryColor,
      width: 2,
    )
    ),
  ),




  // theme of button

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8)
      ),
      textStyle: TextStyle(
        fontSize: 16
      )
    )
  ),

  // outline button theme

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      side: BorderSide(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      textStyle: TextStyle(
        fontSize: 16
      )
    )
  ),

  // circular indicator theme

  progressIndicatorTheme: ProgressIndicatorThemeData(
    circularTrackColor: AppColors.primaryColor,
    color: AppColors.secondryColor
  )
);