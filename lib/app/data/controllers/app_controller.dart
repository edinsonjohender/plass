import 'package:get/get.dart';

import '../model/responseModel.dart';

class AppController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    // ignore: avoid_print
    print(" 🏁 Starting Plass App 🏁 "); 
  }
  ResponseMododel _user = ResponseMododel();
  ResponseMododel get user => _user;
  set user(data){_user = data; update();}
}