
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:m_store/data/repositories/data.repositories/authentication_repository.dart';
import 'package:m_store/features/authentication/models/user_model.dart';
import 'package:m_store/utils/exceptions/firebase_exceptions.dart';
import 'package:m_store/utils/exceptions/format_exceptions.dart';
import 'package:m_store/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();

  final FirebaseFirestore _database=FirebaseFirestore.instance;

  /*====-----<<< function to save user data >>>----====-*/
  Future<void> saveUserRecord(UserModel user)async{
    try{
      await _database.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseException catch(e){
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong, Please try again';
    }
  }


  //fetch user data
  Future<UserModel> fetchUserDetails()async{
    try{
      final documentSnapshot = await await _database.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid ).get();
      if (documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch(e){
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong, Please try again';
    }
  }


  // Update User Data
  Future<void> updateUserDetails(UserModel updateUser)async {
    try {
      await _database.collection('Users').doc(updateUser.id).update(
          updateUser.toJson());
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Update any field in user data
  Future<void> updateSingleField(Map<String , dynamic> json)async {
    try {
      await _database.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Remove User From Data
  Future<void> removeUserRecord(String userId)async {
    try {
      await _database.collection('Users').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw MFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const MFormatException();
    } on PlatformException catch (e) {
      throw MPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }




}