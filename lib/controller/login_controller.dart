import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:letmegrab/view/auth/login_screen.dart';
import 'package:letmegrab/view/home/home_screen.dart';

class AuthController extends GetxController {
  RxBool load = false.obs;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    load.value = true;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      if (credential.user != null) {
        GetStorage().write("isLogin", true);
        Get.snackbar("Success", "Login Successfully");
        Get.offAll(() => HomeScreen());
      }
      load.value = false;
    } on FirebaseAuthException catch (e) {
      load.value = false;
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found for that email.");
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        Get.snackbar("Error", "Invalid Credential");
      }
    } catch (e) {
      load.value = false;
    }
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
    await GetStorage().erase();
    Get.offAll(() => LoginScreen());
  }
}
