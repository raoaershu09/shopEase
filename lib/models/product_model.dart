class ProductModel {
  String id;
  String imageUrl;
  String title;
  String desc;
  String brand;
  String category;
  num    price;
  num    rating;
  int    qty;
  


  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.brand,
    required this.category,
    required this.price,
    required this.rating,
    this.qty = 1
  });


  // from map

  factory ProductModel.fromMap(  Map<String, dynamic>  data){
    return ProductModel(
      id:       data['id'],
      imageUrl: data['imageUrl'],
      title:    data['title'],
      desc:     data['desc'],
      brand:    data['brand'],
      category: data['category'],
      price:    data['price'],
      rating:   data['rating'],
      qty:      data['qty'] ?? 1
      );
  }


  Map<String, dynamic> toMap(){
    return {
      "id":id,
      "imageUrl":imageUrl,
      "title":title,
      "desc":desc,
      "brand":brand,
      "category":category,
      "price":price,
      "rating":rating,
      "qty":qty
    };
  }
}