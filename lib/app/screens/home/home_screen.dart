import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_)=>Scaffold(
        body: Center(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${_.appController.user.email}'),
                Text('${_.appController.user.kind}'),
              ],
            ),
          ),
        ),
      )
    );
  }
}