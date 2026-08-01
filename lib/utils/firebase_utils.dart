import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/model/event_model.dart';
import 'package:evently_app/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  static CollectionReference<EventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
          fromFirestore: (snaphot, options) =>
              EventModel.fromJson(snaphot.data()!),
          toFirestore: (eventmodel, options) => eventmodel.toJson(),
        );
  }

  static Future<void> addEventInFireStore(EventModel event) {
    CollectionReference<EventModel> collectionRef = getEventCollection();
    DocumentReference<EventModel> documentRef = collectionRef.doc();
    event.eventId = documentRef.id;
    return documentRef.set(event);
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignIn signIn = GoogleSignIn.instance;
      await signIn.initialize(
        serverClientId:
            '936359472245-gos9rd299gqbem9rb83j6qbopa50lke2.apps.googleusercontent.com',
      );
      final GoogleSignInAccount account = await signIn.authenticate();
      final idToken = account.authentication.idToken;
      final credential = GoogleAuthProvider.credential(idToken: idToken);

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final user = userCredential.user;
      if (user != null) {
        final userExists = await readUserFromFireStore(user.uid);
        if (userExists == null) {
          await addUserInFireStore(
            UserModel(
              uId: user.uid,
              email: user.email ?? '',
              name: user.displayName ?? '',
            ),
          );
        }
      }
      return userCredential;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }
    }
    return null;
  }
}
