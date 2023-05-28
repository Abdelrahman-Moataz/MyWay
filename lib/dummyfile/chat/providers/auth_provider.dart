import 'package:banda/chat/models/user_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:banda/chat/const/firestore_constants.dart';


enum Status{
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCanceled,
}


class AuthProvider extends ChangeNotifier{
  final FirebaseFirestore firebaseFirestore;
  final FirebaseFirestore firebaseFireStore=FirebaseFirestore.instance;
  final SharedPreferences prefs;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Status _status=Status.uninitialized;
  Status get status =>_status;
  AuthProvider( {required this.prefs, required this.firebaseFirestore });

  //to get the Id of the current user
  String? getUserFirebaseId(){
    return prefs.getString(FireStoreConstants.id);
  }
  
  Future <bool> isLoggedIn()async{
    bool isLoggedIn = await googleSignIn.isSignedIn();
    if (isLoggedIn && prefs.getString(FireStoreConstants.id)?.isNotEmpty == true){
      return true;
    }else{
      return false;
    }
  }

  Future<bool> handelSignIn()async{
    _status = Status.authenticating;
    notifyListeners();


    //to signin with google
    GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser !=null ){
      GoogleSignInAuthentication ? googleAuth = await googleUser.authentication;
      final AuthCredential credential  = GoogleAuthProvider.credential(
        accessToken:  googleAuth.accessToken,
        idToken:  googleAuth.idToken,
      );
      User ? firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
      
      if(firebaseUser !=null){
        final QuerySnapshot result  = await firebaseFireStore.collection(FireStoreConstants.pathUserCollection).where(FireStoreConstants.id,isEqualTo: firebaseUser.uid).get();
        final List <DocumentSnapshot> documents = result.docs;
        if (documents.isEmpty){
          firebaseFireStore.collection(FireStoreConstants.pathMessageCollection).doc(firebaseUser.uid).set(
              {
                FireStoreConstants.nickname: firebaseUser.displayName,
                FireStoreConstants.photoUrl: firebaseUser.photoURL,
                FireStoreConstants.id: firebaseUser.uid,
                'createdAt': DateTime.now().microsecondsSinceEpoch.toString(),
              });
          User ? currentUser = firebaseUser;
          await prefs.setString(FireStoreConstants.id,currentUser.uid);
          await prefs.setString(FireStoreConstants.nickname, currentUser.displayName ?? "");
          await prefs.setString(FireStoreConstants.photoUrl, currentUser.photoURL ?? "");
        }else{
              DocumentSnapshot documentSnapshot = documents[0];
              UserChat userChat = UserChat.fromDocuments(documentSnapshot);
              await prefs.setString(FireStoreConstants.id, userChat.id);
              await prefs.setString(FireStoreConstants.nickname, userChat.nickName);
              await prefs.setString(FireStoreConstants.photoUrl, userChat.photoUrl);
              await prefs.setString(FireStoreConstants.aboutMe, userChat.aboutMe);
        }
        _status = Status.authenticated;
        notifyListeners();
        return true;
      }else{
        _status = Status.authenticateError;
        notifyListeners();
        return false;
      }
      
    }else {
      _status = Status.authenticateCanceled;
      notifyListeners();
      return false;
    }
  }
  // to log out
  Future<void> handleSignOut()async{
    _status = Status.uninitialized;
    await firebaseAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}