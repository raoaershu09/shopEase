import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Categories",
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index){
            return CategoryCard(
              imageUrl: AppImages.phone,
              title: "SmartPhones/Tablets",
              subTitle: "Samsung, Tecno, infinix",
              onPress: () {

              },
            );
          }
          ),
      ),
    );
  }
}