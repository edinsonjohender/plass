import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routers/pages.dart';
import 'app/theme/theme.dart';

import 'app/screens/splash/controllers/splash_binding.dart';
import 'app/screens/splash/splash_screen.dart';
import 'app/utils/dependencies.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  GetStorage.init();
  DependencyInjection.init();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode currenTheme() => ThemeMode.light;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home                      : const SplashScreen(),
      initialBinding            : SplashBinding(),
      getPages                  : AppPages.pages,
      themeMode                 : currenTheme(),
      theme                     : lightTheme(context)
    );
  }
}

