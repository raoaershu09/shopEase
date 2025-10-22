import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ResgisterScreen extends StatelessWidget {
   ResgisterScreen({super.key});


  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                    // logo
              
                      Image.asset(AppImages.appLogoVertical,
                      width: 100.w,
                      height: 100.h,
                      ),
            
                      8.verticalSpace,
            
                      // heading
                      Text(
                        "Create an Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp, 
                        ),
                      ),
            
                      5.verticalSpace,
            
                    // subheading
            
                    Text(
                        "Sign up now to get started with an Account",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade600 
                        ),
                      ),
            
            
                      25.verticalSpace,
            
                      // form
            
                      Form(
                        key: _formKey,
                        child: Column(
                          spacing: 12,
                          children: [
            
                            // name
                             TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: "Enter name"
                              ),
                              validator: Validators.nameValidator,
                             ),
            
            
                            //  phone
            
                            TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: "Enter number",
                              ),
                              validator: Validators.phoneValidator,
                             ),
            
            
                            //  email
            
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Enter email"
                              ),
                              validator: Validators.emailValidator,
                             ),


                            //  password

                        TextFormField(
                          controller: pwController,
                          obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "Enter password",
                          suffixIcon: Icon(Iconsax.eye)
                        ),
                        validator: Validators.passwordValidator,
                       ),


                      //  confirm password

                      TextFormField(
                        obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                      hintText: "Confirm password",
                      suffixIcon: Icon(Iconsax.eye)
                      ),
                      validator: (value) {
                        return Validators.confirmPasswordValidator
                        (value, pwController.text);
                      },
                       ),
                          ],
                        ) 
                        ),


                        15.verticalSpace,

                        // create account


                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Consumer<AuthController>(
                        builder: (_, value, _){

                          return ElevatedButton(
                        onPressed: 
                        value.isRegisterLoading

                        ? null

                        : ()async{
                          if (_formKey.currentState!.validate()) {
                            await value.registerUser(
                              nameController.text,
                              emailController.text,
                              pwController.text,
                              phoneController.text
                              );
                          

                        if (value.getErrorMeassage.isEmpty) {
                        
                          
                            nameController.clear();
                            emailController.clear();
                            phoneController.clear();
                            pwController.clear();

                            showNotification(
                              "Success" "Account created. you can login Now!", value.getErrorMeassage, context
                              );
                              goto(LoginScreen(), context
                            );
                          } else{
                            showNotification(
                        "Error", value.getErrorMeassage, context, isError: true
                        );
                          }
                          }
                        }, 
                        
                        child: 
                        value.isRegisterLoading
                        ? CircularProgressIndicator()
                        : Text("Create Account")
                        );
                        }
                        )
                    ),




                    // already have an account

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an Account?",
                          style: TextStyle(
                            fontSize: 12.sp
                          ),
                          ),

                          TextButton(
                          onPressed: (){
                            gotoAndReplace(LoginScreen(), context);
                          },
                          child: Text("Login",
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                          ), 
                          ),
                      ],
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
}