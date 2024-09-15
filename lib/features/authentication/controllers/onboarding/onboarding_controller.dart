

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instance => Get.find();

// ======----<<<<Variable---->>>>====== //
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


// ======----<<<<Update Current Index When Page is scroll---->>>>====== //
  void updatePageIndicator(index) =>  currentPageIndex.value = index;


// ======----<<<<jump to specific dot selected page---->>>>====== //
  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }


// ======----<<<<Update current index & jump next page---->>>>====== //
  void nextPage(){
    if(currentPageIndex.value==2){
      final storage = GetStorage();
      if(kDebugMode) {
        print('========================GET STORAGE NEXT BUTTON=====================');
        print(storage.read('isFirstTime'));
      }
      storage.write('isFirstTime', false);
      Get.to(()=>const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }


// ======----<<<<Update current index & jump last page---->>>>====== //
  void skipPage(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}