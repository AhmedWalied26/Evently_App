import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/user_model.dart';

class FirebaseUtils {
  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
          fromFirestore: (snapshot, options) =>
              UserModel.fromJson(snapshot.data()!),

          toFirestore: (usermodel, options) => usermodel.toJson(),
        );
  }

  static Future<void> addUserInFireStore(UserModel usermodel) {
    CollectionReference<UserModel> collectionRef = getUserCollection();
    DocumentReference<UserModel> documentRef = collectionRef.doc(usermodel.uId);
    return documentRef.set(usermodel);
  }

  static Future<UserModel?> readUserFromFireStore(String uId) async {
    var querySnapshot = await getUserCollection().doc(uId).get();
    return querySnapshot.data();
  }
}
