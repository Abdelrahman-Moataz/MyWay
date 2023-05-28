import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:banda/chat/const/firestore_constants.dart';

class UserChat{
  String id;
  String photoUrl;
  String nickName;
  String aboutMe;
  
  UserChat({
    required this.photoUrl, 
    required this.aboutMe,
    required this.id,
    required this.nickName,
});
  factory UserChat.fromDocuments(DocumentSnapshot doc){
    String aboutMe = "";
    String photoUrl = "";
    String nickName = "";
    
    try{
      aboutMe = doc.get(FireStoreConstants.aboutMe);
    }catch(e){}

    try{
      photoUrl = doc.get(FireStoreConstants.photoUrl);
    }catch(e){}

    try{
      nickName = doc.get(FireStoreConstants.nickname);
    }catch(e){}
    
    return UserChat(photoUrl: photoUrl, aboutMe: aboutMe, id: doc.id, nickName: nickName);

  }
}