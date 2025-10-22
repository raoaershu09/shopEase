import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle; 
  final VoidCallback onPress;
  
  
   CategoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.onPress
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
                width: double.infinity,
                height: 140.h,
                child: Card(
                  elevation: 0,
                  color: Colors.grey.shade400,
                  child: Row(
                    children: [
                      // image
                      Expanded(
                        flex: 1,
                        child: Image.asset(imageUrl)),
      
      
      
                      // title + subtitle
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                            Text(
                              subTitle,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey.shade800
                              ),
                              
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
    );
  }
}