import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search products...",
        fillColor: AppColors.subTextColor.withAlpha(100),
        filled: true,

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none
        ),

        prefixIcon: Icon(Iconsax.search_normal4)
      ),
    );
  }
}