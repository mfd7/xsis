import 'package:get/get.dart';
import 'package:xsis/presentation/home/controllers/genre_widget_controller.dart';
import 'package:xsis/presentation/home/controllers/home_controller.dart';
import 'package:xsis/presentation/home/controllers/latest_widget_controller.dart';
import 'package:xsis/presentation/home/controllers/popular_widget_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(Get.find()));
    Get.put(PopularWidgetController(Get.find()));
    Get.put(LatestWidgetController(Get.find()));
    Get.put(GenreWidgetController(Get.find(), Get.find()));
  }
}
