import 'package:e_commerce/controllers/address_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/views/address/add_address.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class MyAddressPage extends StatelessWidget {
  const MyAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Address"
        ),
      ),

      body: Consumer<AddressController>(
        builder: (context, value, child){

          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          else if (value.getErrorMessage.isNotEmpty){
            return Center(
              child: Text(value.getErrorMessage),
            );
          }

          else if(value.getAddressList.isEmpty){
            return Center(
              child: Text("No Address in your list"),
            );
          }

          else{
           return Padding(
             padding: const EdgeInsets.all(16),
             child: ListView.builder(
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
                    ),
                  );
                }
                ),
           );
          }
        }
        ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          goto(AddAddressPage(), context);
        },
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        label: Text("Add Address"),
        icon: Icon(Iconsax.location)  
        ),      
    );
  }
}