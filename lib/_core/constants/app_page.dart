import 'package:get/get.dart';
import 'package:xsis/presentation/home/home_binding.dart';
import 'package:xsis/presentation/home/screens/home_screen.dart';
import 'package:xsis/presentation/splash/screens/splash_screen.dart';
import 'package:xsis/presentation/splash/splash_binding.dart';

class AppPage {
  static const splashScreen = '/';
  static const homeScreen = '/home';

  static var pages = <GetPage>[
    //SPLASH
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    //HOME
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
