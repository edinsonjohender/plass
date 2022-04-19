import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSnackBar{
  static show(bool type, String title, String msg){
      Get.snackbar(
        title,msg,
        backgroundColor: type ? Colors.teal : Colors.red,
        colorText: Colors.white,
        icon: Icon( type?  Icons.celebration :  Icons.warning, color: Colors.white),
        margin: const EdgeInsets.only(bottom: 50, right: 10, left: 10),
        snackPosition: SnackPosition.BOTTOM,
      );
  }
}