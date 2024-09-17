import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_store/data/repositories/data.repositories/authentication_repository.dart';
import 'package:m_store/data/repositories/user/user_repositories.dart';
import 'package:m_store/features/authentication/models/user_model.dart';
import 'package:m_store/features/authentication/screens/login/login.dart';
import 'package:m_store/features/authentication/screens/re_authenticateUser/re_authenticate_user.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/popups/full_screen_loader.dart';
import 'package:m_store/utils/popups/loaders.dart';

import '../../../utils/helper/network_manager.dart';

class UserController extends GetxController {
   static UserController get instance => Get.find();

   final profileLoader = false.obs;
   Rx<UserModel> user = UserModel.empty().obs ;

   final hidePassword = false.obs;
   final verifyEmail = TextEditingController();
   final verifyPassword = TextEditingController();
   final userRepository = Get.put(UserRepository());
   GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


   @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch User Record
   Future<void> fetchUserRecord () async {
     try {
       profileLoader.value = true;
       final user = await userRepository.fetchUserDetails();
       this.user(user);
     } catch (e) {
       user(UserModel.empty());
     } finally {
       profileLoader.value = false;
     }
   }


   //Save User Record from any Registration  provider
   Future<void> saveUserRecord (UserCredential? userCredentials) async {
     try {
       if(userCredentials != null){
         // Convert Name to First & Last Name
         final nameParts  = UserModel.nameParts(userCredentials.user!.displayName ?? "");
         final userName  = UserModel.generateUserName(userCredentials.user!.displayName ?? "");

         // Map Data
         final user = UserModel(
             id: userCredentials.user!.uid,
             firstName: nameParts[0],
             lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
             userName: userName,
             email: userCredentials.user!.email ?? '',
             phoneNumber: userCredentials.user!.phoneNumber ?? '',
             profilePicture: userCredentials.user!.photoURL ?? ''
         );

         //Save User Data
         await userRepository.saveUserRecord(user);
       }
     } catch(e) {
       MLoaders.warningSnackBar(
           title: 'Data not saved',
         message: 'Something went wrong while saving your Information. You can re-save your data in your Profile'
       );
     }
   }


    // Delete account warning
    void deleteAccountWarningPopup () {
     Get.defaultDialog(
       contentPadding: EdgeInsets.all(MSize.md),
       title: 'Delete Account',
       middleText: 'Are you sure you want to delete your account permanently? This action is note reversible and all of your data will be removed permanently.',
       confirm: SizedBox(
         height: 53,
         child: ElevatedButton(
             onPressed: () async => deleteUserAccount() ,
             style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: BorderSide(color: Colors.red)),
             child: Padding( padding: EdgeInsets.symmetric(horizontal: MSize.lg),child: Text('Delete'),),
         ),
       ),
       cancel: SizedBox(
         height: 53,
         child: OutlinedButton(
             onPressed: ()=> Get.back(),
             child: Text('Cancel')
         ),
       ),
     );
    }

    // Delete user Account
    void  deleteUserAccount () async {
     try {
       // Start Loader
       MFullScreenLoader.openLoadingDialog('Processing', 'assets/images/animations/loading.json');

       // First Re-Authenticate User
       final auth = AuthenticationRepository.instance;
       final provider = auth.authUser!.providerData.map((e)=> e.providerId).first;
       if (provider.isNotEmpty) {
         // Re-Verify Auth Email
         if ( provider == 'google.com'){
           await auth.signInWithGoogle();
           await auth.deleteAccout();
           MFullScreenLoader.stopLoading();
           MLoaders.errorSnackBar(title: 'Congratulations ', message: 'Your account has been deleted');
           Get.offAll(()=> LoginScreen());
         } else if ( provider == 'password') {
           MFullScreenLoader.stopLoading();
           Get.to(()=> ReAuthenticateUser());
         }
       }
     } catch (e) {
       MFullScreenLoader.stopLoading();
       MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
     }
    }

    //Re-Authenticate before delete
     Future<void> reAuthenticateEmailAndPasswordUser () async {
     try {
       // Start Loader
       MFullScreenLoader.openLoadingDialog('Processing', 'assets/images/animations/loading.json');

       // Check Internet
       final isConnected = await NetworkManager.instance.isConnected();
       if (!isConnected) {
         MFullScreenLoader.stopLoading();
         return;
       }

       //Form validate
       if (!reAuthFormKey.currentState!.validate()) {
         MFullScreenLoader.stopLoading();
         return;
       }

       await AuthenticationRepository.instance.reAuthenticateEmailAndPasswordUser(verifyEmail.text.trim() , verifyPassword.text.trim());
       await AuthenticationRepository.instance.deleteAccout();
       MFullScreenLoader.stopLoading();
       Get.offAll(()=> LoginScreen());
     } catch(e) {
       MFullScreenLoader.stopLoading();
       MLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
     }
     }


}
