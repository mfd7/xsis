import 'package:flutter/material.dart';
import 'package:xsis/_core/constants/app_flavor.dart';
import 'package:xsis/_core/xsis.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFlavor(
    baseUrl: 'https://api.themoviedb.org/3',
    imgUrl: 'https://image.tmdb.org/t/p/original',
    flavor: Flavor.dev,
  );
  runApp(const Xsis());
}
