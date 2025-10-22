import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/core/themes/light_theme.dart';
import 'package:e_commerce/views/auth/resgister.dart';
import 'package:e_commerce/views/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: AuthGate(),
      )
      );
  }
}


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthController>(
      builder: (_, value, _) {

        if (value.isInitialLoaing) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        else{
          if (value.getUserData == null) {
            return ResgisterScreen();
          }

          else{
            return NavigationWrapper();
          }
        }
      }
      );
  }
}