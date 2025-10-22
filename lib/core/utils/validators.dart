class Validators {

  static String? nameValidator(String? value){
    if (value!.isEmpty) {
      return "Name is required";
    }
  }


  static String? emailValidator(String? value){
    if (value!.isEmpty) {
      return "Email is required";
    }

    else if(!value.contains('@') || !value.contains(".com")){
      return "Please provide valid email address";
    }
  }


  static String? phoneValidator(String? value){
    if (value!.isEmpty) {
      return "Phone is required";
    }

    else if(!RegExp(r'^((\+92)?(0092)?(92)?(0)?)(3)([0-4]{1})([0-9]{1})([0-9]{7})$').hasMatch(value)
    )
    {
      return "Please provide valid phone number";
    }
  }


  static String? passwordValidator(String? value){
    if (value!.isEmpty) {
      return "Password is required";
    }

    else if(value.length < 6){
      return "Password should be atleast 6 digits long";
    }
  }


  static String? confirmPasswordValidator(String? value, password){
    if (value!.isEmpty) {
      return "Confirm Password is required";
    }

    else if(value != password){
      return "Password does not match";
    }
  }
}