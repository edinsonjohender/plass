import 'dart:async';

import 'package:get/get.dart';
import '../../../data/controllers/app_controller.dart';

class SplashController extends GetxController{
  
  final AppController    appController      = Get.find<AppController>();
 
  @override
  void onReady()async {
    super.onReady();
    _init();
  }

    _init(){
      Timer(const Duration(seconds: 2), (){Get.offAllNamed('/login');});
    }

  
}