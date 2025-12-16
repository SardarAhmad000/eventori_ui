import 'dart:async';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../services/shared_preferences/shared_preference.dart';
import 'auth_controller.dart';
import 'base_controller.dart';

class SocialSignInController extends GetxController {
  RxString userId = "".obs;
  RxString userName = "".obs;
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString appleUserName = "".obs;
  RxString userEmail = "".obs;
  RxString userPhoto = "".obs;
  final AuthController authController = Get.find();
  BaseController _baseController = BaseController.instance;
  final AuthPreference _authPreference = AuthPreference.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  Future<void> googleSignOut() async {
    googleSignIn.disconnect();
    // setUserLoggedIn(false);
    // print("")
  }
  Future<void> signInWithGoogle() async {

    try {
      _baseController.showLoading();
      await googleSignOut();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return; // User canceled sign-in

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Get user details
      User? user = userCredential.user;
      if (user != null) {
        userId.value = user.uid;
        userEmail.value = user.email ?? "No Email";
        userPhoto.value = user.photoURL ?? "";

        String fullName = user.displayName ?? "No Name";
        List<String> nameParts = fullName.split(" ");

        firstName.value = nameParts.isNotEmpty ? nameParts.first : "";
        lastName.value = nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "";

        print("First Name: $firstName");
        print("Last Name: $lastName");
        // Optional: store them in variables or reactive values
        userName.value = fullName;
        // firstNameRx.value = firstName;
        // lastNameRx.value = lastName;
      }

      print("User ID: ${userId.value}");
      print("User Name: ${userName.value}");
      print("User Email: ${userEmail.value}");
      print("User Photo: ${userPhoto.value}");
      authController.loginUserWithSocialMethod(firstName.value, lastName.value, userEmail.value,'Google', userId.value);
      _baseController.hideLoading();
    } catch (e) {
      _baseController.hideLoading();
      print("Google Sign-In Error: $e");
      // CustomDialog.showErrorDialog(description: e.toString());

    }
  }

}