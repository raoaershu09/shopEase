class AddressModel {

  String id;
  String name;
  String phone;
  String city;
  String street;

  AddressModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.city,
    required this.street
  });

  factory AddressModel.fromMap(  Map<String,dynamic> data ){
    return AddressModel(
      id: data['id'],
      name: data['name'],
      phone: data['phone'],
      city: data['city'],
      street: data['street']
      );
  }


  Map<String, dynamic> toMap(){
    return {
      "id":id,
      "name":name,
      "phone":phone,
      "city":city,
      "street":street
    };
  }
}