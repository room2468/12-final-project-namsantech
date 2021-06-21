import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String name;
String email;
String password;
String imageUrl;

Future<void> signOutEmail() async {
  FirebaseAuth.instance.signOut();
  print("User Signed Out");
}

Future<User> signInWithGoogle() async {
  await Firebase.initializeApp();
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );
}

Future<User> signUp(String email, String password) async {
  await Firebase.initializeApp();
  try {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

Future<User> signIn(String email, String password) async {
  await Firebase.initializeApp();
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    assert(user != null);
    assert(await user.getIdToken() != null);
    return user;
  } catch (e) {
    print(e.toString());
    return null;
  }
}

// Future<String> signUp(String emailInput, String password) async {
//   await Firebase.initializeApp();
//   try {

//   } on FirebaseAuthException catch (e) {
//     if (e.code == 'user-not-found') {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: emailInput, password: password);
//       return await signUp(emailInput, password);
//     } else if (e.code == 'wrong-password') {
//       print('Wrong password provided for that user.');
//       return null;
//     }
//   }
//   return null;
// }
