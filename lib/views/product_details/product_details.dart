
import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {

  final ProductModel productData;

  const ProductDetailsScreen({super.key, required this.productData});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {



  void handleAddToCart(ProductModel product){

    bool isAdded = context.read<CartController>().addToCart(product);

    if (isAdded) {
      showNotification("Cart", "Item added to your cart", context);
    }

    else{
      showNotification("Cart", "Item already exist in your cart", context);
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // image
        
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.3,
        
              width: double.infinity,
              child: Card(
                color: AppColors.primaryColorLite,
                child: Image.network(widget.productData.imageUrl),
              ),
            ),
        
        
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // titile
                   Row(
                     children: [
                       Expanded(
                         child: Text(
                          widget.productData.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                         ),
                       ),



                      //  qty / inc /dec

                      Consumer<CartController>(
                        builder: (_, value, _){
                          if (value.checkIfExist(widget.productData)) {
                            return Row(
                        spacing: 5,
                        children: [

                          // inc

                          GestureDetector(
                            onTap: (){
                              value.incremantQty(widget.productData);
                            },
                            child: Icon(
                              Icons.add_circle,
                              color: AppColors.primaryColor,
                              size: 30,
                            ),
                          ),


                          // qty

                          Text(
                            widget.productData.qty.toString(),
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),


                          // dec

                          GestureDetector(
                            onTap: (){
                              value.decrementQty(widget.productData);
                            },
                            child: Icon(
                              Icons.remove_circle,
                              color: AppColors.primaryColor,
                              size: 30,
                            ),
                          ),
                        ],
                      );
                          }

                          else{
                            return SizedBox.shrink();
                          }
                        }
                        )

                     ],
                   ),
        


                  //  rating
        
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded, size: 30, color: AppColors.secondryColor
                      ),
                      Text(
                        widget.productData.rating.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),



                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      RichText(
                        text: TextSpan(
                          text: "Category: ",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold
                          ),

                          children: [
                            TextSpan(
                              text: widget.productData.category,
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ]
                        ),
                      ),

                      RichText(
                        text: TextSpan(
                          text: "Brand: ",
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold
                          ),
                          children: [
                            TextSpan(
                              text: widget.productData.brand,
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500
                              )
                            )
                          ]
                        ),
                      )
                    ],
                  ),



                // descr

                Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),

                Text(
                  widget.productData.desc,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade600
                  ),
                )
                  
                ],
              ),
              )
        
          ],
        ),
      ),



      persistentFooterButtons: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            spacing: 15,
            children: [
              // price

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      color: Colors.grey.shade700
                    ),
                  ),

                  Text(
                    "\$${(widget.productData.price * widget.productData.qty).toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),


              // button

              Expanded(
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: 
                    context.watch<CartController>().checkIfExist(widget.productData)
                    ? null
                    
                    : (){
                      handleAddToCart(widget.productData);
                    },
                    child: Text("Add to Cart")
                    ),
                )
                )
            ],
          ),
          )
      ],
    );
  }
}