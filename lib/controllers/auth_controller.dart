import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController  extends ChangeNotifier{

  // contructor

  AuthController(){
    _isInitializeUser();
  }



  // service

  AuthService _authService = AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;


  // state variables

  bool _isRegisterLoading = false;
  bool _isLoginLoading    = false;
  bool _isLogoutLoading   = false;
  bool _isInitialLoading  = false;
  String _error = "";
  UserModel? _userData;

  // getters

  bool       get isRegisterLoading => _isRegisterLoading;
  bool       get isLoginLoading    => _isLoginLoading;
  bool       get isLogoutLoading   => _isLogoutLoading;
  bool       get isInitialLoaing   => _isInitialLoading;
  String     get getErrorMeassage  => _error;
  UserModel? get getUserData       => _userData;


  // methods

  _isInitializeUser()async{
    _isInitialLoading = true;
    _auth.authStateChanges().listen((userData) async{

      if (userData == null) {
        _userData = null;
        notifyListeners();
      }


      else{
        _userData = await _authService.getUserData();
        _error = "";
        notifyListeners();
      }

      _isInitialLoading = false;
      notifyListeners();
    }
    
    );
  }



  // register user

  Future<void> registerUser(String name, email, password, phone) async{
    try {

      _isRegisterLoading = true;
      _error = "";
      notifyListeners();

      await _authService.register(name, email, password, phone);

      _isRegisterLoading = false;
      _error = "";
      notifyListeners();

    } catch (e) {
      _isRegisterLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }



  // login


  Future<void> loginUser(String email,password) async{
    try {

      _isLoginLoading = true;
      _error = "";
      notifyListeners();

    _userData = await _authService.login(email, password);

      _isLoginLoading = false;
      _error = "";
      notifyListeners();

    } catch (e) {
      _isLoginLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }




  // logout user


  Future<void> logoutUser(String email,password) async{
    try {

      _isLogoutLoading = true;
      _error = "";
      notifyListeners();

     await _authService.logout();

      _isLogoutLoading = false;
      _error = "";
      notifyListeners();

    } catch (e) {
      _isLogoutLoading = false;
      _error = e.toString();
      notifyListeners();
    }
  }
}