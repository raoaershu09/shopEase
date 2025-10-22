import 'package:e_commerce/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [


          // bg image
          Positioned.fill(
            child: Image.asset(AppImages.carousel, fit: BoxFit.cover,
            ),
            ),


            // content

            Row(
              children: [


                // picture

                Expanded(
                  child: Image.asset(AppImages.phone, height: 200.h)
                  ),


                // text + button

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      spacing: 20,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    
                        // text
                    
                        Text(
                          "Special Deals on ShopEase",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    
                    
                    
                        // button
                    
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white
                          ),
                        onPressed: (){},
                        child: Text("Buy Now"),
                        )
                      ],
                    ),
                  )
                  )
              ],
            )
        ],
      ),
    );
  }
}