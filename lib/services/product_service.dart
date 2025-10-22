import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/product_model.dart';

class ProductService {
  

  // instances
  FirebaseFirestore _database = FirebaseFirestore.instance;




  Future<  List<  ProductModel   >   >  getAllProducts()async{
    try {
      List<ProductModel> productList = [];

      var snapshot = await _database.collection('products').get();

      productList = snapshot.docs.map(  (doc){

        return ProductModel.fromMap( doc.data() );
      }).toList();


      return productList;
    
    
    } on FirebaseException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }



  // get products by category


    Future<  List<  ProductModel   >   >  getProductsByCategory(String category)async{
    try {
      List<ProductModel> productList = [];

      var snapshot = await _database
      .collection('products')
      .where('category', isEqualTo: category)
      .get();

      productList = snapshot.docs.map(  (doc){

        return ProductModel.fromMap( doc.data() );
      }).toList();


      return productList;
    
    
    } on FirebaseException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }




  // get categopries
  Future<  List<String>> getCategories()async{
    try {
      var snapshot = await _database.collection('products').get();


      Set<String> categopries = {};


      for (var doc in snapshot.docs) {
        categopries.add(doc.data()['category']);
      }


      return categopries.toList();


    } on FirebaseException 
    
    catch (e) {
    throw e.message ?? "Something went wrong";  
    }
  }
}