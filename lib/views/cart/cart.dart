import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          "My Cart",
        ),
        centerTitle: true,
      ),

      body: Consumer<CartController>(
        builder: (_, value ,_){

          if (value.getCartList.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Icon(
                    Iconsax.shopping_bag4, 
                    size: 100,
                    color: Colors.grey,
                    ),
                  Text(
                    "No items found in your cart",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                    ),
                  )
                ],
              )
            );
          }

          else {
            return ListView.builder(
              itemCount: value.getCartList.length,
              itemBuilder: (context, index) {
                var item = value.getCartList[index];

                return CartItemCard(
                  product: item,
                  onRemove:() {
                    value.removeFromCart(item);
                  },
                  onInc:(){
                    value.incremantQty(item);
                  },
                  onDec:(){ 
                    value.decrementQty(item);
                  }
                  
                );
              },
            );
          }
        }
        ),

        persistentFooterButtons: [
          Consumer<CartController>(
            builder: (context, value, child){
              if (value.getCartList.isEmpty) {
                return SizedBox.shrink();
              }
              else{
                return Column(
                  spacing: 20,
            children: [

              // price
              Row(
                
                children: [
                  Text(
                    "Total Amount: ",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "\$${context.watch<CartController>().getTotalPrice().toStringAsFixed(2)}",
                    style: TextStyle(
                      color: AppColors.subTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text("Checkout")
                  ),
              )
            ],
          );
              }
            }
            )
        ],

    );
  }
}