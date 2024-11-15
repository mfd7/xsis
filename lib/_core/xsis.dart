import 'package:alice_get_connect/alice_get_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:xsis/_core/constants/app_constant.dart';
import 'package:xsis/_core/constants/app_flavor.dart';
import 'package:xsis/_core/constants/app_page.dart';
import 'package:xsis/_core/initial_binding.dart';

class Xsis extends StatefulWidget {
  const Xsis({super.key});

  @override
  State<Xsis> createState() => _XsisState();
}

class _XsisState extends State<Xsis> {
  late final AliceGetConnect alice;

  @override
  void initState() {
    //INIT ALICE
    alice = Get.put(
      AliceGetConnect(
          timeout: const Duration(
        milliseconds: AppConstant.kConnectionTimeout,
      )),
      permanent: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: alice.getNavigatorKey(),
        title: AppFlavor.instance.appName,
        initialBinding: InitialBinding(),
        getPages: AppPage.pages,
        locale: const Locale('id', 'ID'),
      ),
    );
  }
}
