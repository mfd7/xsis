import 'package:get/get.dart';
import 'package:xsis/data/data_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    DataBinding().dependencies();
  }
}
