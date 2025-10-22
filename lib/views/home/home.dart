import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/views/categories/category_products.dart';
import 'package:e_commerce/views/product_details/product_details.dart';
import 'package:e_commerce/widgets/carousel_card.dart';
import 'package:e_commerce/widgets/category_button.dart';
import 'package:e_commerce/widgets/product_card.dart';
import 'package:e_commerce/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.appLogoHorizental, width: 120.w,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge.count(
              count: 2,
              backgroundColor: AppColors.danger,
              child: Icon(Iconsax.notification),
              ), 
            ),
        ],
      ),


    // body
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
        
            // search
        
            SearchField(),
        
            8.verticalSpace,
        
            // carousel
        
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: double.infinity,
              child: Swiper(
                itemCount: 3,
                itemBuilder: (context, index){
                  return CarouselCard();
                }
                ),
            ),
        
        
            // categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Categories",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
        
                TextButton(
                  onPressed:() {}, 
                  child: Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  )
              ],
            ),
        
        
            // category cards
            Consumer<ProductController>(
              builder: (_, value ,_){
                if (value.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                else if(value.getErrorMessage.isNotEmpty){
                  return Center(
                    child: Text(value.getErrorMessage),
                  );
                }

                else if(value.getCategoryList.isEmpty){
                  return Center(
                    child: Text("No categories Found"),
                  );
                }


                else {
                  return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 90,
              ), 
        
              itemCount: value.getCategoryList.length > 4
              ? value.getCategoryList.sublist(0,4).length
              : value.getCategoryList.length,

              itemBuilder: (context, index){
                return CategoryButton(
                  icon: AppImages.getCategories(value.getCategoryList[index]),
                  text: value.getCategoryList[index],
                  onPress: (){
                    goto(CategoryProducts(categoryName: value.getCategoryList[index]), context);
                  },
                );
              }
              );
                }
              }
              ),
        
        
        
            // products
        
        
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Products",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
        
                TextButton(
                  onPressed:() {}, 
                  child: Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                  )
              ],
            ),

            Consumer<ProductController>(
              builder: (_, value, _){
                if (value.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                else if(value.getErrorMessage.isNotEmpty){
                  return Center(
                    child: Text(value.getErrorMessage),
                  );
                }

                else if(value.getProductList.isEmpty){
                  return Center(
                    child: Text("No Products Found"),
                  );
                }

          else{
            return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: value.getProductList.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: value.getProductList[index],
                          onTap: (){
                            goto(ProductDetailsScreen(productData: value.getProductList[index]), context);
                          },
                        );
                      },
                    );
                }
              },
              ),
          ],
        ),
      ),
    ),
    );
  } 
}