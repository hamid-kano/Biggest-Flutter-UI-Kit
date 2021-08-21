import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/integrations/screens/firebaseCrud/model/FBusermodel.dart';

class FirebaseUserService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late CollectionReference ref;
  String? userID;

  FirebaseUserService() {
    ref = fireStore.collection("users");
  }



  Future<DocumentReference> addDocument(Map<String, dynamic> data) async {
    var res = await ref.add(data);
    res.update({"id":res.id});
    return res;
  }


  Stream<List<FBUserModel>> getData(){
    return  ref.snapshots().map((event) => event.docs.map((e) => FBUserModel.fromJson(e.data() as Map<String,dynamic>)).toList());
  }

  Future<void> updateDocument(Map<String, dynamic> data, String? id) => ref.doc(id).update(data);

  Future<void> removeDocument(String? id) => ref.doc(id).delete();
}


