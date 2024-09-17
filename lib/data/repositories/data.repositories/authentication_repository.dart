import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:m_store/data/repositories/user/user_repositories.dart';
import 'package:m_store/features/authentication/screens/login/login.dart';
import 'package:m_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:m_store/features/authentication/screens/signup/verifiy_email.dart';
import 'package:m_store/navigation_menu.dart';
import 'package:m_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:m_store/utils/exceptions/firebase_exceptions.dart';
import 'package:m_store/utils/exceptions/format_exceptions.dart';
import 'package:m_store/utils/exceptions/platform_exceptions.dart';


class AuthenticationRepository extends GetxController{

  static AuthenticationRepository get instance => Get.find();


//Variable //
final deviceStorage = GetStorage();
final _auth = FirebaseAuth.instance;

//Get Logged User Data
  User? get authUser => _auth.currentUser;


//Called form main.dart on app lunch //
@override
  void onReady() {
  //Remove the Native Splash Screen/
    FlutterNativeSplash.remove();
  //Redirect to the appropriate Screen/
    screenRedirect();
  }


// =====----<<<<Function to Show Relevant Screen>>>>----==== //
screenRedirect ( )async   {
  final user = _auth.currentUser;
  if(user != null){
    // print(user.email);
    if(user.emailVerified){
      Get.offAll(()=> NavigationMenu());
    } else {
      Get.offAll(()=> VerifyEmailScreen(
        email: _auth.currentUser?.email,));
    }
  } else {
  /*-----<<<local Storage>>>------*/
    if(kDebugMode) {
      print('========================GET STORAGE Auth Repo=====================');
      print(deviceStorage.read('isFirstTime'));
    }
    deviceStorage.writeIfNull('isFirstTime', true);
  /*-----<<<Check if it's the first time launching the app>>>-----*/
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(()=> const LoginScreen())   // Redirect to the login screen if not the first time
        : Get.offAll(()=> const OnboardingScreen());  // Redirect to the Onboarding screen if it's the first time
  }
}




// ======----<<<<E-mail & Password Authentication>>>>----======= //

// ======----<<<<Login-User---->>>>======= //
  Future<UserCredential> loginWithEmailAndPassword (String email , String password) async {
  try {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseException(e.code).message;
  } on FormatException catch(_) {
    throw const MFormatException();
  } on PlatformException catch(e) {
    throw MPlatformException(e.code).message;
  } catch(e){
    throw 'Something went wrong. Please try again';
  }
}



// ======----<<<<Register-User---->>>>======= //
 Future<UserCredential> registerWithEmailAndPassword (String email , String password) async {
  try {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);

  } on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseException(e.code).message;
  } on FormatException catch(_) {
    throw const MFormatException();
  } on PlatformException catch(e) {
    throw MPlatformException(e.code).message;
  } catch(e){
    throw 'Something went wrong. Please try again';
  }
 }


// ======----<<<<Email-Verification---->>>>======= //
 Future<void> sendEmailVerification ()async {
  try {
    await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseException(e.code).message;
  } on FormatException catch(_) {
    throw const MFormatException();
  } on PlatformException catch(e) {
    throw MPlatformException(e.code).message;
  } catch(e){
    throw 'Something went wrong. Please try again';
  }
 }

 // Forget Password
  Future<void> sendPasswordResetEmail (String email)async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const MFormatException();
    } on PlatformException catch(e) {
      throw MPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }



// ======----<<<<Google - SignIn---->>>>======= //
 Future<UserCredential?> signInWithGoogle ()async {
  try {
    //trigger the authentication flow
    final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

    // obtain the auth details from request
    final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

    //create new credential
    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );

    //return credential when user sing in
    return _auth.signInWithCredential(credentials);

  } on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseException(e.code).message;
  } on FormatException catch(_) {
    throw const MFormatException();
  } on PlatformException catch(e) {
    throw MPlatformException(e.code).message;
  } catch(e){
    print('Something went wrong. $e');
    return null;
  }
 }



//ReAuthenticateUser
  Future<void> reAuthenticateEmailAndPasswordUser (String email , String password) async {
    try {
      //Create a Credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      //ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const MFormatException();
    } on PlatformException catch(e) {
      throw MPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }





// ======----<<<<Logout User---->>>>======= //
Future<void> logoutUser () async {
  try {

    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAll((()=> LoginScreen()));
  } on FirebaseAuthException catch (e) {
    throw MFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw MFirebaseException(e.code).message;
  } on FormatException catch(_) {
    throw const MFormatException();
  } on PlatformException catch(e) {
    throw MPlatformException(e.code).message;
  } catch(e){
    throw 'Something went wrong. Please try again';
  }
}


// Delete User Account
  Future<void> deleteAccout () async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
      Get.offAll((()=> LoginScreen()));
    } on FirebaseAuthException catch (e) {
      throw MFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const MFormatException();
    } on PlatformException catch(e) {
      throw MPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }





















}