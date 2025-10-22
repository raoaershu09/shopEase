import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {

  final  ProductModel product;
  final  VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
      
                     Positioned.fill(
                      child:  Card(
                    elevation: 0,
                    color: AppColors.subTextColor.withAlpha(80),
                    child: Image.network(product.imageUrl),
                  ),
                  ),
      
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Icon(
                      Icons.favorite_rounded,
                      color: AppColors.danger,
                    ),
                  )
      
                    ],
                  )
                ),
              ),
              ),
      
      
              // title
      
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    // price + rating
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price}"
                        ),
                    
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              color: AppColors.secondryColor,
                            ),
                            Text(product.rating.toString()),
                            
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
      
      
          ],
        ),
      ),
    );
  }
}