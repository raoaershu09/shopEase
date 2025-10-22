import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/core/utils/validators.dart';
import 'package:e_commerce/views/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController pwController = TextEditingController();
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
                        "Login to your Account",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp, 
                        ),
                      ),
            
                      5.verticalSpace,
            
                    // subheading
            
                    Text(
                        "Welcome back please enter your details",
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
            
                            
                            //  email
            
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Enter email",
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
                          suffixIcon: Icon(Iconsax.eye),
                        ),
                        validator: Validators.passwordValidator,
                       ),
                         
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                          onPressed: (){}, 
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                          ),
                        ),

                          ]
                        )
                      ),

                      15.verticalSpace,

                    // sign in
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Consumer<AuthController>(
                        builder: (_,value,_){
                          return ElevatedButton(
                        onPressed: 
                        value.isLoginLoading
                        ? null

                        : ()async{
                          if (_formKey.currentState!.validate()) {
                            
                            await value.loginUser(
                              emailController.text, pwController.text
                            );

                            if (value.getErrorMeassage.isEmpty) {
                              
                              emailController.clear();
                              pwController.clear();

                              showNotification(
                              "Success, Welcome to shopease ", value.getErrorMeassage, context
                              );

                              gotoAndRemoveAll(NavigationWrapper(), context );
                            }

                            else{
                              showNotification(
                                "Failed", value.getErrorMeassage, context );
                            }
                          }
                        }, 
                        child: value.isLoginLoading
                        ? const CircularProgressIndicator()
                        : const Text("Sign In"),

                        );
                        },
                        )
                    ),

                    
                    15.verticalSpace,


                    // divider


                    Row(

                      spacing: 10,

                      children: [

                        Expanded(
                        child: Divider(
                          indent: 20,
                          color: Colors.grey.shade600,
                        ),
                        ),

                        Text(

                        "Or continue with",
                        style: TextStyle(
                          color: AppColors.subTextColor
                        ),
                        ),

                        Expanded(
                        child: Divider(
                          endIndent: 20,
                          color: Colors.grey.shade600,
                        ),
                        ),

                      ],
                    ),

                    15.verticalSpace,

                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: OutlinedButton.icon(
                      onPressed: (){}, 
                      label: Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontSize: 16.sp
                        ),
                      ),

                      icon: Image.asset(
                      AppImages.googleLogo,
                      width: 26.sp,
                      height: 26.sp,
                      ),
                      ),
                    ),

                    // already have an account

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don't have an Account?",
                          style: TextStyle(
                            fontSize: 12.sp
                          ),
                          ),

                          TextButton(
                          onPressed: (){},
                          child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                          ), 
                          ),
                      ],
                    ),

                    ],
                  ),
               
          ),
        ),
      ),
    );
  }
}