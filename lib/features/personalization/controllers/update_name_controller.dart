import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:m_store/data/repositories/user/user_repositories.dart';
import 'package:m_store/features/personalization/controllers/user_controller.dart';
import 'package:m_store/features/personalization/screens/profile/profile.dart';
import 'package:m_store/utils/popups/full_screen_loader.dart';
import 'package:m_store/utils/popups/loaders.dart';

import '../../../utils/helper/network_manager.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Fetch User Record
   Future<void> initializeNames( ) async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
   }


   Future <void> updateUserName () async {
    try {
      // Start Loading
      MFullScreenLoader.openLoadingDialog('We are updating your information', 'assets/images/animations/loading.json');

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MFullScreenLoader.stopLoading();
        return;
      }

      //Form validate
      if (!updateUserNameFormKey.currentState!.validate()) {
        MFullScreenLoader.stopLoading();
        return;
      }

      // Update Your First Name & last name
      Map<String , dynamic > name = {
        'FirstName' : firstName.text.trim(),
        'LastName' : lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //Update the RX User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      MFullScreenLoader.stopLoading();

      // Show Some Message
      MLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your name is updated.' ,
      );

      // Move The previous Screen
      Get.off(() => const ProfileScreen());

    } catch(e) {
      // Remove Loader
      MFullScreenLoader.stopLoading();
      MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());

    }
   }
}
