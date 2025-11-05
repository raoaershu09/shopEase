import 'package:e_commerce/controllers/address_controller.dart';
import 'package:e_commerce/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddAddressPage extends StatelessWidget {
   AddAddressPage({super.key});


  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Address"
        ),
      ),

      body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
            
              children: [
            
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter Name"
                  ),
                  ),
            
                  TextField(
                    controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Phone"
                  ),
                ),
            
            
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                    hintText: "Enter City"
                  ),
                ),
            
            
                TextField(
                  controller: streetController,
                  decoration: InputDecoration(
                    hintText: "Enter Street"
                  ),
                ),


                SizedBox(
              height: 50,
              width: double.infinity,
              child: Consumer<AddressController>(
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: 
                    value.isLoading
                    ? null
                    : () async{


                      // uuid object
                      Uuid uuid = Uuid();


                      // generate id
                      String addressId = uuid.v1();
                      


                      // data prepare
                      AddressModel myAddress = AddressModel(
                        id: addressId, 
                        name: nameController.text,
                        phone: phoneController.text,
                        city: cityController.text,
                        street: streetController.text
                        );

                     await value.addAddreess(myAddress);
                    },
                    
                    child: 
                    value.isLoading
                    ?CircularProgressIndicator()
                    :Text("Add Address"),
                  );
                },
              ),
            )
              ],
            ),
          ),
    );
  }
}