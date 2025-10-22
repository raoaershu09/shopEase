import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier {
  

  // state variable
  List<ProductModel> _cartList = [];



  // getters
  List<ProductModel>get getCartList => _cartList;




  // methods:

  // 1. add to cart

  bool addToCart(ProductModel newProduct){
    int index = _cartList.indexWhere( (existingProduct) => existingProduct.id == newProduct.id ); //-1

    if (index == -1) {
      _cartList.add(newProduct);
      notifyListeners();
      return true;
    }

    else{
      notifyListeners();
      return false;
    }
  }

  // 2. remove from cart 

  removeFromCart(ProductModel product){
    _cartList.removeWhere( (existingItem) => existingItem.id == product.id );
    notifyListeners();

  }


  // 3. increment

   incremantQty(ProductModel product){
    int index = _cartList.indexWhere( (existing) => existing.id == product.id );
    if (index != -1) {
      _cartList[index].qty++;
      notifyListeners();
    }
  }



  // 4. decrement

  decrementQty(ProductModel product){
    int index = _cartList.indexWhere( (existing) => existing.id == product.id);
    if (index != -1) {
      if (_cartList[index].qty>1 ) 
      {
        _cartList[index].qty--;
        notifyListeners();
      }
    }
  }



  // 5. check existance

  bool checkIfExist(ProductModel newProduct){
    int index = _cartList.indexWhere( (existingProduct) => existingProduct.id == newProduct.id ); //-1

    if (index == -1) {
      return false;
    }

    else{
      return true;
    }
  }


  // 6. total price
   
 double getTotalPrice(){
    double totalPrice = 0;
    for (var product in _cartList) {
      totalPrice += product.qty * product.price;
    }
    return totalPrice;
  }
}