import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:m_store/data/repositories/data.repositories/authentication_repository.dart';
import 'package:m_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:m_store/utils/popups/full_screen_loader.dart';

import '../../../../utils/helper/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

      //Variables
      final email = TextEditingController();
      GlobalKey<FormState> fogetPasswordFormKey  = GlobalKey<FormState>();

      // Send Reset Password Email
       sendPasswordResetEmail  () async {
         try{
           // Start Loader
           MFullScreenLoader.openLoadingDialog('Processing your request', 'assets/images/animations/loading.json');

           // Check Internet
           final isConnected = await NetworkManager.instance.isConnected();
           if (!isConnected) {
             MFullScreenLoader.stopLoading();
             MLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection.');
             return;
           }


           if(!fogetPasswordFormKey.currentState!.validate()){
             MFullScreenLoader.stopLoading();
             return;
           }

           // Send Email to Reset Password
           await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

           // Remove Loader
           MFullScreenLoader.stopLoading();

           // Show Success Screen
           MLoaders.successSnackBar(title: 'Email Sent' , message: 'Email Link Sent to Reset Password'.tr );

           Get.to(()=> ResetPassword(email: email.text.trim()));

         } catch (e) {
           // Remove Loader
           MFullScreenLoader.stopLoading();
           MLoaders.errorSnackBar(title: 'Oh Snap' , message:  e.toString());
         }
       }

       resendPasswordResetEmail  (String email) async {
         try{
           // Start Loader
           MFullScreenLoader.openLoadingDialog('Processing your request', 'assets/images/animations/loading.json');

           // Check Internet
           final isConnected = await NetworkManager.instance.isConnected();
           if (!isConnected) {
             MFullScreenLoader.stopLoading();
             MLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection.');
             return;
           }
           // Send Email to Reset Password
           await AuthenticationRepository.instance.sendPasswordResetEmail(email);

           // Remove Loader
           MFullScreenLoader.stopLoading();

           // Show Success Screen
           MLoaders.successSnackBar(title: 'Email Sent' , message: 'Email Link Sent to Reset Password'.tr );

         } catch (e) {
           // Remove Loader
           MFullScreenLoader.stopLoading();
           MLoaders.errorSnackBar(title: 'Oh Snap' , message:  e.toString());
         }
       }

}