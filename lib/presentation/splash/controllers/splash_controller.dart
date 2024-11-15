import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(AppPage.homeScreen);
  }
}
