import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tedikap_flutter_app/firebase/firebase_auth_services.dart';
import 'package:tedikap_flutter_app/routes/AppPages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuthService _authServices = FirebaseAuthService();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  final RxBool obscureText = true.obs;
  final RxBool isSigningUp = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void login() {
    Get.offNamed(Routes.REGISTER_PAGE);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

   void signIn() async {
  
  String email = emailController.text;
  String password = passwordController.text;

  User? user = await _authServices.signInWithEmailAndPassword(email, password);

  isSigningUp.value = false;

  if (user != null) {
    Get.showSnackbar(
      GetSnackBar(
        message: "User is successfully created",
        duration: Duration(seconds: 2),
      ),
    );
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    // Navigasi ke halaman home
    Get.toNamed(Routes.BOTTOM_NAVBAR);
  } else {
    Get.showSnackbar(
      GetSnackBar(
        message: "Some error happened",
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}

void signInWithGoogle(BuildContext context) async {
    try {
      if (_auth.currentUser == null) {
        final GoogleSignInAccount? account = await _googleSignIn.signIn();

        if (account != null) {
          final GoogleSignInAuthentication auth = await account.authentication;
          final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: auth.accessToken,
            idToken: auth.idToken,
          );

          await _auth.signInWithCredential(credential);
        }
      } else {
        _googleSignIn.signOut();
        _auth.signOut();

        Get.showSnackbar(
          GetSnackBar(
            message: "Anda sudah logout",
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
