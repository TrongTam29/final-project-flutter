import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  late String _uuid;

  Future<User> loginWithGoogle() async {
    try {
      googleAccount.value = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount.value!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final user = (await auth.signInWithCredential(credential)).user;

      // final User? user = authResult.user;
      _uuid = user!.uid;

      return user;
      // assert(!user!.isAnonymous);
      // assert(await user!.getIdToken() != null);
      // final User? currentUser = auth.currentUser;
      // assert(user!.uid == currentUser!.uid);
      // Get.to(() => HomeSreen());
      // _uuid = user!.uid; // navigate to your wanted page
      // return;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> logoutGoogle() async {
    print('logoutGoogle');
    googleAccount.value = await googleSignIn.signOut();
    auth.signOut();
  }

  logIn() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', _uuid);
  }

  autoLogin() async {
    var prefs = await SharedPreferences.getInstance();

    String? _uid = prefs.getString('uid');

    print("Autologin: " + _uid!);
    return _uid.toString();
  }

  logOut() async {
    var prefs = await SharedPreferences.getInstance();
    print('Removed ');
    await prefs.remove('uid');
  }
}
