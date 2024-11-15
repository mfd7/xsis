import 'package:get/get.dart';
import 'package:xsis/data/genre/datasources/genre_remote_datasource.dart';
import 'package:xsis/data/genre/repositories/genre_repository_impl.dart';
import 'package:xsis/domain/genre/repositories/genre_repository.dart';

class DataGenreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenreRemoteDatasource>(
      () => GenreRemoteDatasourceImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<GenreRepository>(
      () => GenreRepositoryImpl(Get.find()),
      fenix: true,
    );
  }
}
