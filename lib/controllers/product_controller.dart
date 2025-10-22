import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  
  // constructor

  ProductController(){
    loadProducts();
    loadCategories();
  }

  // instances //services

  ProductService _productService = ProductService();



  // state variables

  List<ProductModel> _productList = [];
  List<ProductModel> _categoryProductList = [];
  List<String> _categoryList = [];


  bool _isLoading =  true;
  bool _isCategoryLoading = false;
  String _error = "";






  // getters

  List<ProductModel> get getProductList => _productList;
  List<ProductModel> get getCategoryProductList => _categoryProductList;
  List<String> get getCategoryList => _categoryList;



  bool get isLoading => _isLoading;
  bool get isCategoryLoading => _isCategoryLoading;
  String get getErrorMessage => _error;




  // methods

  // load products


  Future<void>loadProducts()async{
    try {

      _isLoading = true;
      _error = "";
      notifyListeners();

      _productList = await _productService.getAllProducts();


      _isLoading = false;
      _error = "";
      notifyListeners();

      } 
        catch (e) {
          _isLoading = false;
          _error = e.toString();
          notifyListeners();
    }
  }


  // load categories

  Future<void> loadCategories()async{
    try {
      _isLoading = true;
      _error = "";
      notifyListeners();


      _categoryList = await _productService.getCategories();


      _isLoading = false;
      _error = "";
      notifyListeners();


    } catch (e) {
      _isLoading = false;
      _error = "";
      notifyListeners();
    }
  }



  // load products by category

  Future<void> loadProductsByCategory(String category)async{
    try {
      _isCategoryLoading = true;
      _error = "";
      notifyListeners();


      _categoryProductList = await _productService.getProductsByCategory(category);


      _isCategoryLoading = false;
      _error = "";
      notifyListeners();


    } catch (e) {
      _isCategoryLoading = false;
      _error = "";
      notifyListeners();
    }
  }

}