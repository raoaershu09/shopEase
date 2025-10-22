import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
          
          
              // picture
          
              Stack(
                alignment: AlignmentGeometry.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primaryColorLite,
          
          
                    child: Text(
                      "A",
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
          
          
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.white,
          
          
                    child: Icon(
                      Iconsax.camera,
                      size: 18,
                    )
                  ),
                ],
              ),
          
              15.verticalSpace,
          
          
              // name
          
              Text(
                "Aershuman",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
          
          
              // profile options
          
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: options.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: Icon(options[index].icon),
                    title: Text(options[index].title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded),
                  );
                },
          
                separatorBuilder: (context, index){
                  return Divider(
                    indent: 55,
                    endIndent: 25,
                    thickness:2,
                  );
                }
                )
            ],
          ),
        ),
      ),
    );
  }
}


class ProfileOptions {
  IconData icon;
  String title;
  VoidCallback onPress;


  ProfileOptions({
    required this.icon,
    required this.title,
    required this.onPress
  });
}


List<ProfileOptions> options = [

  ProfileOptions(
    icon: Iconsax.user, 
    title: "My Profile", 
    onPress: (){

    }
    ),


    ProfileOptions(
    icon: Iconsax.shopping_bag, 
    title: "My Orders", 
    onPress: (){

    }
    ),


    ProfileOptions(
    icon: Iconsax.location, 
    title: "My Address", 
    onPress: (){

    }
    ),


    ProfileOptions(
    icon: Iconsax.shopping_bag, 
    title: "Payment Method", 
    onPress: (){

    }
    ),


    ProfileOptions(
    icon: Iconsax.heart, 
    title: "My WishList", 
    onPress: (){

    }
    ),


    ProfileOptions(
    icon: Iconsax.setting, 
    title: "Account Setting", 
    onPress: (){

    }
    ),


    ProfileOptions(
    icon: Iconsax.logout, 
    title: "Logout", 
    onPress: (){

    }
    ),
];