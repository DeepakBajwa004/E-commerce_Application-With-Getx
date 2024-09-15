

import 'package:get/get.dart';
import 'package:m_store/utils/helper/network_manager.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}