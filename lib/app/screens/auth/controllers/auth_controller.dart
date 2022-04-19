import 'package:get/get.dart';
import 'package:plass/app/data/provider/plass_api.dart';
import 'package:plass/app/utils/constants.dart';

import '../../../data/controllers/app_controller.dart';

class AuthController extends GetxController{

  final AppController    appController      = Get.find<AppController>();


  bool _isLoader                = false;
  bool  get isLoader            => _isLoader;
  set isLoader(data){_isLoader  = _isLoader ? false : true; update();}

  var user = {};

  Future registerUser(email, pass) async {
    isLoader = true;
    Map <String, dynamic> body = {
      "email"    : email,
      "password" : pass,
    };
    await PlassApi.post(path: '/v1/accounts:signUp', body: body, token: Constants.firebaseToken);
    isLoader = false;
    update();
  }
  
  Future loginrUser(email, pass) async {
    isLoader = true;
    Map <String, dynamic> body = {
      "email"    : email,
      "password" : pass,
    };
    var response = await PlassApi.post(path: '/v1/accounts:signInWithPassword', body: body, token: Constants.firebaseToken);

      if(response.error != null){
        print(response);
          //appController.user = response;   isLoader = false; Get.toNamed('/home'); 
      }


    
    update();
  }

}