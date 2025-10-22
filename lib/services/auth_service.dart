import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  

  // instances
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _database = FirebaseFirestore.instance;




  // methods




  // register

  Future<void>register(
    String name,
    String email,
    String password,
    String phone
  )
  async{
    try {

      // register user

      await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // define the data that will be store in firestore

      UserModel userData = UserModel(
     id: _auth.currentUser!.uid,
      name: name,
      email: email,
      phone: phone
       );

      //  store the data in firestore

     await _database.collection("users").doc(userData.id).set(  userData.toMap()  );

    } on FirebaseException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }



    // login

    Future<UserModel?> login(
      String email,
      String password,
    )
    async{
      try {

        // register user

        await _auth.signInWithEmailAndPassword(email: email, password: password);


        // get the user data from firestore
        DocumentSnapshot<Map<String,dynamic>> userData = await _database.collection('users').doc(_auth.currentUser!.uid).get();

       return UserModel.fromMap(userData.data()!);
        

      } on FirebaseException catch (e) {
        throw e.message ?? "Something went wrong";
      }
    }


  // signout

  Future<void> logout()async{
    try {

      await _auth.signOut();

      } on FirebaseException catch (e) {
        throw e.message ?? "Something went wrong";
      }
  }


  // get user
  Future<UserModel?> getUserData()async{
    try {
      var snapshot = 
      await _database.collection('users')
      .doc(_auth.currentUser!.uid).get();

      return UserModel.fromMap(snapshot.data()!);

    } 
    
    on FirebaseException catch (e) {
      throw e.message ?? "Something went wrong";
    }
  }

}