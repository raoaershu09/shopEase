import 'package:e_commerce/models/address_model.dart';
import 'package:e_commerce/services/address_service.dart';
import 'package:flutter/material.dart';

class AddressController extends ChangeNotifier {

  AddressController(){
    loadAddresses();
  }
    // services
    AddressService _addressService = AddressService();



    // state variables
    List<AddressModel> _addressList = [];
    bool _isLoading = false;
    String _error = '';



    // getters
    List<AddressModel> get getAddressList => _addressList;
    bool get isLoading => _isLoading;
    String get getErrorMessage => _error;



    // methods
    Future<void>addAddreess(AddressModel address)async{
        try {
          _isLoading = true;
          _error = '';
          notifyListeners();

        await _addressService.addNewAddress(address);
        loadAddresses();

        _isLoading = false;
        _error = '';
        notifyListeners();

        } catch (e) {
          _isLoading = false;
          _error = e.toString();
          notifyListeners();
        }
    }


    Future<void>deleteAddreess(String id)async{
        try {
          _isLoading = true;
          _error = '';
          notifyListeners();

        await _addressService.deleteAddress(id);
        loadAddresses();

        _isLoading = false;
        _error = '';
        notifyListeners();

        } catch (e) {
          _isLoading = false;
          _error = e.toString();
          notifyListeners();
        }
    }


    Future<void>loadAddresses()async{
        try {
          _isLoading = true;
          _error = '';
          notifyListeners();

    _addressList  =  await _addressService.getAddresses();

        _isLoading = false;
        _error = '';
        notifyListeners();

        } catch (e) {
          _isLoading = false;
          _error = e.toString();
          notifyListeners();
        }
    }

}