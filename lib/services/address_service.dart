import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/address_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddressService {


  // instance variable

  FirebaseFirestore _database = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;


  // methods

 Future addNewAddress(AddressModel address)async{
    try {
    await  _database
    .collection('users')
    .doc(_auth.currentUser!.uid)
    .collection('address')
    .doc(address.id)
    .set(address.toMap());

    return true;

    } on FirebaseException catch (e) {
      throw e.message ?? "something went wrong";
    }
  }


  Future deleteAddress(String id)async{
    try {
    await  _database
    .collection('users')
    .doc(_auth.currentUser!.uid)
    .collection('address')
    .doc(id)
    .delete();

    return true;

    } on FirebaseException catch (e) {
      throw e.message ?? "something went wrong";
    }
  }



  Future <List <AddressModel> > getAddresses()async{
    try {
      var result =   await  _database
    .collection('users')
    .doc(_auth.currentUser!.uid)
    .collection('address')
    .get();


    return result.docs.map((doc){
      return AddressModel.fromMap(doc.data());
    }).toList();


    } on FirebaseException catch (e) {
      throw e.message ?? "something went wrong";
    }
  }
}