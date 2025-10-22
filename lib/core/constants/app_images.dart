class AppImages {
  static String appLogoVertical   = "assets/images/logo_vert.png";
  static String appLogoHorizental = "assets/images/logo_hori.png";
  static String carousel          = "assets/images/carousel.png";
  static String onboard1          = "assets/images/onboard1.png";
  static String onboard2          = "assets/images/onboard2.png";
  static String onboard3          = "assets/images/onboard3.png";
  static String googleLogo        = "assets/images/google.png";
  static String phone             = "assets/images/phone.png";




  // icons
  static String phoneIcon      = "assets/icons/phone.png";
  static String laptopIcon     = "assets/icons/laptop.png";
  static String cameraIcon     = "assets/icons/camera.png";
  static String watchIcon      = "assets/icons/watch.png";



  static String getCategories(String category){
    switch (category.toLowerCase()) {
      case "laptops": return laptopIcon;
      case "smartphones": return phoneIcon;
      case "watch": return watchIcon;
      case "camera": return cameraIcon;
        
      default: return laptopIcon;
    }
  }
}