// ignore_for_file: must_be_immutable

import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {

  String icon;
  String text;
  VoidCallback onPress;
  
  
  CategoryButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: [
          // card
          SizedBox.square(
            dimension: 65,
            child: Card(
              elevation: 0,
              color: AppColors.primaryColorLite,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Image.asset(icon),
              ),
            ),
          ),
      
      
      
      
          // text
      
          Text(
            text,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          )
          
        ],
      ),
    );
  }
}