import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/views/cart/cart.dart';
import 'package:e_commerce/views/categories/categories.dart';
import 'package:e_commerce/views/home/home.dart';
import 'package:e_commerce/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavigationWrapper extends StatelessWidget {
  const NavigationWrapper({super.key});

  @override  
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        padding: const EdgeInsets.only(top: 8),
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
            navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
            ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
         navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property
      );
  }


List<Widget> _buildScreens(){
  return <Widget>[

    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen()
  ];

}


List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(Iconsax.home),
                title: ("Home"),
                activeColorPrimary: AppColors.primaryColor,
                inactiveColorPrimary: Colors.grey,
            ),


            PersistentBottomNavBarItem(
                icon: Icon(Iconsax.category),
                title: ("Category"),
                activeColorPrimary: AppColors.primaryColor,
                inactiveColorPrimary: Colors.grey,
            ),


             PersistentBottomNavBarItem(
                icon: Icon(Iconsax.shopping_cart),
                title: ("Cart"),
                activeColorPrimary: AppColors.primaryColor,
                inactiveColorPrimary: Colors.grey,
            ),

 
            PersistentBottomNavBarItem(
                icon: Icon(Iconsax.user),
                title: ("Profile"),
                activeColorPrimary: AppColors.primaryColor,
                inactiveColorPrimary: Colors.grey,
            ),
        ];
    }

}
