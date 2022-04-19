

import 'package:get/get.dart';
import 'package:plass/app/routers/routes.dart';


import '../screens/splash/controllers/splash_binding.dart';
import '../screens/splash/splash_screen.dart';

import '../screens/auth/controllers/auth_binding.dart';
import '../screens/auth/login_screen.dart';


import '../screens/home/controllers/home_binding.dart';
import '../screens/home/home_screen.dart';

class AppPages{
  static final List<GetPage> pages = [    
    
    GetPage(
      name: AppRoutes.splash, 
      page: () => const SplashScreen(),
      binding: SplashBinding()
    ),
    GetPage(
      name: AppRoutes.login, 
      page: () => const LoginScreen(),
      binding: AuthBinding()
    ),
    GetPage(
      name: AppRoutes.home, 
      page: () => const HomeScreen(),
      binding: HomeBinding()
    ),
    


  ];
}