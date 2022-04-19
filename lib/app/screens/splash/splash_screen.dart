import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/splash_controller.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_)=> Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(),
                      Center(
                        child: Container(
                          width: 270,
                          alignment: Alignment.center,
                          child: const Image(image: AssetImage('assets/images/logo-dark.png'),),
                        )
                      ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text('Copyright © 2022 by Edinson ',  style: Get.theme.textTheme.bodyText1,),
                    )
                  ]
                )
              )
            );
          }
        )
      )
    );
  }
}