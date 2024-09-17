import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:m_store/data/repositories/data.repositories/authentication_repository.dart';
import 'package:m_store/features/personalization/controllers/user_controller.dart';
import 'package:m_store/utils/popups/loaders.dart';

import '../../../../utils/helper/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // ======----<<<<Variable---->>>>======= //
  final rememberMe = false.obs;                   // Observable for Remember Me
  final hidePassword = true.obs;                  // Observable for hiding/showing Password
  final localStorage = GetStorage();
  final email = TextEditingController();          // Controller For Email Input
  final password = TextEditingController();       // Controller For Password Input
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>(); // Form Key For Form Validation

  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
  }

  // ======----<<<<Sign-IN---->>>>======= //
  Future<void> signIn() async {
    try {
      // Start full-screen loader
      MFullScreenLoader.openLoadingDialog('Logging you in...', 'assets/images/animations/loading.json');

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        MLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection.');
        return;
      }

      if (!signInFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }

      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      MFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  // ======----<<<<Google Sign-IN---->>>>======= //
  Future<void> googleSignIn() async{
     try{
       MFullScreenLoader.openLoadingDialog('Logging in...', 'assets/images/animations/loading.json');

       // Check Internet
       final bool isConnected = await NetworkManager.instance.isConnected();
       if (!isConnected) {
         MFullScreenLoader.stopLoading();
         //MLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection.');
         return;
       }

       // Google Auth
       final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

       // Save User Record
       await userController.saveUserRecord(userCredentials);

       //Remove Loader
       MFullScreenLoader.stopLoading();

       //Redirect User
       AuthenticationRepository.instance.screenRedirect();

     } catch (e) {
       //Remove Loader
       MFullScreenLoader.stopLoading();
       MLoaders.errorSnackBar(title: 'Oh Snap' , message:  e.toString());
     }
  }
}
