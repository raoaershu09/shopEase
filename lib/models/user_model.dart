class UserModel {
  String? id;
  String name,email,phone;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone
  });


  // from map
  factory UserModel.fromMap( Map<String, dynamic> data ){
    return UserModel(
      id: data['id'],
      name: data['name'], 
      email: data['email'], 
      phone: data['phone']
      );
  }


  // to map
  Map<String,dynamic> toMap(){
    return {
      "id" : id,
      "name" : name,
      "email" : email,
      "phone" : phone
    };
  }
}