import 'package:xsis/_core/constants/app_constant.dart';

enum Flavor { dev, prod }

class AppFlavor {
  final Flavor flavor;
  final String baseUrl;
  final String imgUrl;
  final String appName;
  static late AppFlavor _instance;
  static bool initialize = false;

  factory AppFlavor({
    required flavor,
    required baseUrl,
    required imgUrl,
    appName = AppConstant.kAppName,
  }) {
    initialize = true;
    _instance = AppFlavor._initialize(flavor, baseUrl, imgUrl, appName);
    return _instance;
  }

  AppFlavor._initialize(this.flavor, this.baseUrl, this.imgUrl, this.appName);

  static AppFlavor get instance {
    return _instance;
  }

  static bool get isDev => _instance.flavor == Flavor.dev;
}
