import 'package:banda/loginpages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../NavBar.dart';
import '../models/facebook_model.dart';



class AuthController extends GetxController {

  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUsername = "";
  var  displayUserPhoto = "";
  var displayUserEmail = "";
  var displayUserMob = "";
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  FaceBookModel? faceBookModel;

  var isSignedIn = false;
  final GetStorage authBox = GetStorage();


  
  void visibility(){
    isVisibility = !isVisibility;
    
    update();
  }
  
  void checkBox(){
    isCheckBox = !isCheckBox;
    
   update();
  }
  
  
  //Sign Up with firebase
  void signUpUsingFirebase(
  {
    required String name,
    required String email,
    required String password,

  }
      )async{

    try{
       await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
         displayUsername = name;
         auth.currentUser!.updateDisplayName(name);

       });
       update();
       Get.to(const NavBarPage());
    }on FirebaseAuthException catch(error){
      String title =error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ="";


      if(error.code == "weak-password"){
        message = "the password is too weak.";
      }else if(error.code == "Email-already-in-use"){
        message  = "Email-already-in-use";
      }else {
        message = error.message.toString();
      }
      Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
    }catch (error){
      Get.snackbar("Error!", error.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
    }
    
  }
  



  void logInUsingFirebase({
    required String email,
    required String password,
          })async{

    try {
       await auth.signInWithEmailAndPassword
        (email: email, password: password)
      .then((value) => displayUsername = auth.currentUser!.displayName!);

       isSignedIn = true;
       authBox.write("auth", isSignedIn);
       update();
       Get.to(const NavBarPage());


    }on FirebaseAuthException catch(error){
      String title =error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ="";


      if(error.code == 'user-not-found'){
        message = 'Account does not exists for that $email.. Create your account by Signing up..';
      }else if(error.code == 'wrong-password'){
        message = 'invalid password... plz try again';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
    }catch(error){
      Get.snackbar("Error!", error.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
    }
  }
  
  void googleSignUp()async{


    try{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUsername = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      displayUserEmail = googleUser.email;


      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.to(const NavBarPage());
    }catch(error){
      Get.snackbar("Error!", error.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
    }

  }
  
  void resetPassword(String email)async{
    try {
      auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();


    }on FirebaseAuthException catch(error){
      String title =error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message ="";


      if(error.code == 'user-not-found'){
        message = 'Account does not exists for that $email.. Create your account by Signing up..';
      }else{
        message = error.message.toString();
      }
      Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
    }catch(error){
      Get.snackbar("Error!", error.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
    }
  }

  void facebookSignUp()async{

    // Trigger the sign-in flow

    final LoginResult loginResult = await FacebookAuth.instance.login();

    if(loginResult.status == LoginStatus.success){
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromjsom(data);

      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.to(const NavBarPage());
    }}


  void signOutFromApp()async{

    try{

      await auth.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.i.logOut();
      displayUsername = '';
      displayUserPhoto ='';
      isSignedIn = false;
      authBox.remove("auth");
      update();
      Get.to(LoginPage());

    }
        catch(error){
          Get.snackbar("Error!", error.toString(),snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.redAccent,colorText: Colors.white);
        }


  }

}