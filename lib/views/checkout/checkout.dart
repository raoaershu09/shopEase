import 'package:e_commerce/controllers/address_controller.dart';
import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/models/address_model.dart';
import 'package:e_commerce/views/address/add_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {

CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  TextEditingController streetController = TextEditingController();

  AddressModel? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 
          "Checkout"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // cart items
              Text(
                "Cart Items",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
          
              5.verticalSpace,
              _cartItemSection(context),
          
              15.verticalSpace,
          
              Text(
                "Billing Summary",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
              // billing summary
          
              5.verticalSpace,
              _billingSummarySection(context),
          
          
              // address
          
              15.verticalSpace,
          
              Text(
                "Address",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600 
                ),
              ),
          
              5.verticalSpace,
              _adressSection(context),

            20.verticalSpace
          
              // order place
            ],
          ),
        ),
      ),

      persistentFooterButtons: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: (){

            }, 
            child: Text("Place Order")
            ),
        )
      ],
    );
  }

  Widget _cartItemSection(BuildContext context){
    return Consumer<CartController>(
      builder: (_, value ,_){
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: value.getCartList.length,
          itemBuilder: (context, index) {

            var item = value.getCartList[index];

            return Card(
              color: Colors.white,
              shadowColor: Colors.black,
              elevation: 10,


              child: Row(
                children: [
                  // image
                  SizedBox.square(
                    dimension: 100,
                    child: Card(
                      elevation: 0,
                      color: AppColors.subTextColor.withAlpha(120),

                      // image
                      child: Image.network(item.imageUrl),
                    ),
                      ),


                      10.horizontalSpace,

                      // other details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                          // title

                            Text(
                              item.title,
                              style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15
                              ),
                              ),


                              // brand

                              Text(
                              item.brand,
                              style: TextStyle(
                              color: AppColors.subTextColor,
                              fontSize: 12
                              ),
                              ),


                              // price

                              Text(
                              "\$${item.price}",
                              style: TextStyle(
                              color: AppColors.subTextColor,
                              fontSize: 12
                              ),
                              ),


                              // qty

                              Text(
                              "Quantity: ${item.qty}",
                              style: TextStyle(
                              color: AppColors.subTextColor,
                              fontSize: 12
                              ),
                              ),
                          ],
                        )
                        )
                ],
              ),
            );
          },
          );
      }
      );
  }

  // billing summary
 Widget _billingSummarySection(BuildContext context){

  var cartController = Provider.of<CartController>(context);

  double subTotal = cartController.getTotalPrice();

  double tax = subTotal * 0.08;

  double shippingFee = 200;

  double grandTotal = subTotal + tax + shippingFee;

  return SizedBox(
    width: double.infinity,
    child: Card.outlined(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 5,
          children: [
        
            // sub total
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SubTotal",
                  style: TextStyle(
                  fontSize: 14,
                  ),
                  ),
        
                  Text(
                    "\$${subTotal.toString()}",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.subTextColor
                    ),
                  )
              ],
            ),
        
        
            // tax
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tax(8%)",
                  style: TextStyle(
                  fontSize: 14,
                  ),
                  ),
        
                  Text(
                    "\$${tax.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.subTextColor
                    ),
                  )
              ],
            ),
        
        
            // shipping charges
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping Fee",
                  style: TextStyle(
                  fontSize: 14,
                  ),
                  ),
        
                  Text(
                    "\$${shippingFee.toString()}",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.subTextColor
                    ),
                  )
              ],
            ),
        
            Divider(
              color: AppColors.iconColor,
            ),
        
            // grand total
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                  fontSize: 14,
                  ),
                  ),
        
                  Text(
                    "\$${grandTotal.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.subTextColor
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  }

  Widget _adressSection(BuildContext context){
    return Card.outlined(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 10,


      child: selectedAddress == null

      ? ListTile(title: Text("Provide Address"),

      trailing: TextButton(
          onPressed: (){
            _showAddressSheet(context);
          }, 
          child: Text(
            "Choose",
            style: TextStyle(
              color: AppColors.secondryColor
            ),
            
            )
          ),
      
      )

      : ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryColorLite,
          child: Icon(Iconsax.location, color: AppColors.primaryColor,),
        ),
        title: Text("${selectedAddress!.street}, ${selectedAddress!.city}",
        style: TextStyle(
          fontSize: 14
        ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(selectedAddress!.name),
            Text(selectedAddress!.phone)
          ],
        ),

        trailing: TextButton(
          onPressed: (){
            _showAddressSheet(context);
          }, 
          child: Text(
            "Choose",
            style: TextStyle(
              color: AppColors.secondryColor
            ),
            
            )
          ),
      )
    );
  }

  _showAddressSheet(BuildContext context){
    showModalBottomSheet(
      showDragHandle: true,
      context: context, 
      builder: (context){
        return Consumer<AddressController>(
          builder: (context, value, child){
            if (value.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            else if (value.getAddressList.isEmpty){
              return Center(
                child: Text(
                  "No Addresses found"
                ),
              );
            }

            else{
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 12,
                  children: [
                    Text(
                      "Choose Delivery Address",
                      style: TextStyle( 
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.getAddressList.length,
                        itemBuilder: (context, index){
                                   
                          var myAddress = value.getAddressList[index];
                                   
                          return Card(
                            color: AppColors.subTextColor.withOpacity(0.3),
                            shadowColor: Colors.black,
                            elevation: 0,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColors.primaryColorLite,
                                child: Icon(Iconsax.location, color: AppColors.primaryColor),
                              ),
                                   
                              title: Text(
                                "${myAddress.street}, ${myAddress.city}",
                                style: TextStyle(
                                  fontSize: 14
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(myAddress.name),
                                  Text(myAddress.phone)
                                ],
                              ),

                              // radio
                              trailing: Radio(
                                value: myAddress,
                                groupValue: selectedAddress,
                                onChanged: (value){
                                  setState(() {
                                    selectedAddress = value;
                                  });

                                  Navigator.pop(context);
                                }
                                ),

                            ),
                          );
                        }
                        ),
                    ),
                
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (){
                          goto(AddAddressPage(), context);
                        }, 
                        child: Text("Add new address")
                        ),
                    )
                  ],
                ),
              );
            }

          }
          );
      }
      );
  }

  void addAddress(){

  }
}