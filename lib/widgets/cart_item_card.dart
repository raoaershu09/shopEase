import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CartItemCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onRemove;
  final VoidCallback? onInc;
  final VoidCallback? onDec;

  const CartItemCard({
    super.key,
    required this.product,
    this.onInc,
    this.onDec,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Card(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // image
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: double.infinity,
                  child: Card(
                    color: Colors.grey.shade400,
                    child: Image.network(product.imageUrl, fit: BoxFit.cover),
                  ),
                ),
              ),

              // content
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title + delete
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: onRemove, // ✅ FIXED
                          child: const Icon(Iconsax.trash),
                        ),
                      ],
                    ),

                    // brand
                    Text(
                      product.brand,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    // price + qty
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // price
                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // qty counter
                        Row(
                          children: [
                            // inc
                            GestureDetector(
                              onTap: onInc, // ✅ FIXED
                              child: Icon(
                                Icons.add_circle,
                                color: AppColors.primaryColor,
                                size: 28,
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                product.qty.toString(),
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            // dec
                            GestureDetector(
                              onTap: onDec, // ✅ FIXED
                              child: Icon(
                                Icons.remove_circle,
                                color: AppColors.primaryColor,
                                size: 28,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
