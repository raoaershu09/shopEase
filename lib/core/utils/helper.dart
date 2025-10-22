import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void goto(Widget page , BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}


void gotoAndReplace(Widget page , BuildContext context){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}


void gotoAndRemoveAll(Widget page , BuildContext context){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => page,) , (route)=>false );
}


showNotification(String title, message, BuildContext context, 
{bool isError = false}){

  toastification.show(
  context: context, // optional if you use ToastificationWrapper
  type: isError == true ? ToastificationType.error : ToastificationType.success,
  style: ToastificationStyle.flatColored,
  autoCloseDuration: const Duration(seconds: 3),
  title: Text(title,style: TextStyle(color: Colors.black),),
  // you can also use RichText widget for title and description parameters
  description: RichText(text: TextSpan(
     text: message,style: TextStyle(color: Colors.black), )),
  alignment: Alignment.topRight,
  direction: TextDirection.ltr,
  animationDuration: const Duration(milliseconds: 300),


  // showIcon: true, // show or hide the icon
  // primaryColor: isError == true ? Colors.red : Colors.green,
  // backgroundColor: Colors.white,
   foregroundColor: Colors.black,


  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(
      color: Color(0x07000000),
      blurRadius: 16,
      offset: Offset(0, 16),
      spreadRadius: 0,
    )
  ], 
);
}


showLoading(BuildContext context){

  showDialog(
    context: context,
    builder: (context){
      return Dialog(
        child: Card(
          child: Column(
            spacing: 20,

            children: [

              // loading indicator

              CircularProgressIndicator(),

              // processing ...

              Text("Processing")
            ],
          ),
        ),
      );
    }
    );
}




hideLoading(BuildContext context){
  Navigator.pop(context);
}