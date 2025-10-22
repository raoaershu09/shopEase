import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_images.dart';
import 'package:e_commerce/core/utils/helper.dart';
import 'package:e_commerce/views/auth/resgister.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          // onboarding content

          Expanded(
            child: PageView.builder(
              onPageChanged: (index){
                setState(() {
                  currentIndex = index; 
                });
              },
              controller: _pageController,
              itemCount: OnboardingList.length,
              itemBuilder: (context , index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                  
                      // image
                  
                      Image.asset(OnboardingList[index].image,
                      height: 200.h,
                      width: 200.w,
                      
                      
                      ),
                  
                      20.verticalSpace,
                  
                      // title
                  
                      Text(
                        OnboardingList[index].title,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  
                  
                  
                      // desc
                  
                      Text(
                        OnboardingList[index].desc,
                        style: TextStyle(
                          color: AppColors.subTextColor,
                          fontSize: 14.sp,
                         
                        ),
                  
                        textAlign: TextAlign.center,
                      ),
                  
                    
                    ],
                  
                  ),
                );
              }
              )
              ),

              // indicator

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  spacing: 80,

                  

                  children: [


                    SmoothPageIndicator(    
                    controller: _pageController,
                    count:  OnboardingList.length,    


                    effect:  ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 10,
                      dotColor: AppColors.secondryColor,
                      activeDotColor: AppColors.primaryColor
                    ),  // your preferred effect 
                    onDotClicked: (index){    
                    }
                    ),

                    // get started button

                    SizedBox(
                      height: 50.h,
                      width: double.infinity,

                      child: 
                      currentIndex == 2

                     ? ElevatedButton(
                      onPressed: (){
                        gotoAndReplace(ResgisterScreen(), context);
                      },
                      child: Text("Get Started")
                      )

                      : null,
                      
                    ),
                  ],
                ),
              ),

        ],
      ),
    );
  }
}





class OnboardingModel {
  String image;
  String title;
  String desc;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.desc,
  });
}

List<OnboardingModel> OnboardingList = [

  OnboardingModel(
    image: AppImages.onboard1, 
    title: "Welcome to the ShopEase", 
    desc:   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    ),


    OnboardingModel(
    image: AppImages.onboard2, 
    title: "Shop with Ease", 
    desc:   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    ),


    OnboardingModel(
    image: AppImages.onboard3, 
    title: "Order any time Any where", 
    desc:   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book"
    ),
  ];