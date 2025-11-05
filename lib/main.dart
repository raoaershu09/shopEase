import 'package:e_commerce/app.dart';
import 'package:e_commerce/controllers/address_controller.dart';
import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(
    MultiProvider(providers: 
    [
      ChangeNotifierProvider(create: (context) => AuthController(),),
      ChangeNotifierProvider(create: (context) => ProductController(),),
      ChangeNotifierProvider(create: (context) => CartController(),),
      ChangeNotifierProvider(create: (context) => AddressController(),),
    ],

    child: MyApp(),

    )
  );
}