import 'package:cloud_firestore/cloud_firestore.dart';
import '../const/firestore_constants.dart';



class HomeProvider {
  final FirebaseFirestore firebaseFireStore;
  HomeProvider({
  required this.firebaseFireStore,
});

  Stream<QuerySnapshot>getStreamFireStore(String collectionPath,int limit,String textSearch){

    if(textSearch.isNotEmpty==true){
      return firebaseFireStore.collection(collectionPath).limit(limit).where(FireStoreConstants.nickname,isEqualTo: textSearch).snapshots();
    }

    return firebaseFireStore.collection(collectionPath).limit(limit).snapshots();
  }

}