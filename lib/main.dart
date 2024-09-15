import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'data/repositories/data.repositories/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {

  //===----<<< Widgets Bindings >>>----===//
  final WidgetsBinding  widgetsBinding =  WidgetsFlutterBinding.ensureInitialized();

  //===----<<< Getx Local Storage >>>----===//
  await GetStorage.init();

  //===----<<< Native Splash >>>----===//
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //===----<<< Initialize Firebase & Authentication Repository >>>----===//
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()),);

  runApp(const MyApp());

}


