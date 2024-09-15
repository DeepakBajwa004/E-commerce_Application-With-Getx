import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instancce => Get.find();

  final  carousalcurrentIndex = 0.obs;

  void updatePageIndicator (index ) {
    carousalcurrentIndex.value = index;
  }
}
