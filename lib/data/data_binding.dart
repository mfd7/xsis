import 'package:alice_get_connect/alice_get_connect.dart';
import 'package:get/get.dart';
import 'package:xsis/_core/constants/app_flavor.dart';
import 'package:xsis/data/_core/api_base_helper.dart';
import 'package:xsis/data/_core/interceptors/auth_interceptor.dart';
import 'package:xsis/data/_core/interceptors/logger_interceptor.dart';
import 'package:xsis/data/genre/data_genre_binding.dart';
import 'package:xsis/data/movie/data_movie_binding.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    //API BASE HELPER
    Get.put(
      ApiBaseHelper(
        client: GetConnect().httpClient,
        interceptors: [
          AuthInterceptor(),
          LoggerInterceptor(),
          if (AppFlavor.isDev) ...[
            Get.find<AliceGetConnect>(),
          ],
        ],
      ),
      permanent: true,
    );

    DataMovieBinding().dependencies();
    DataGenreBinding().dependencies();
  }
}
