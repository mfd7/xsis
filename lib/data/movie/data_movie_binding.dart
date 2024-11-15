import 'package:get/get.dart';
import 'package:xsis/data/movie/datasources/movie_remote_datasource.dart';
import 'package:xsis/data/movie/repositories/movie_repository_impl.dart';
import 'package:xsis/domain/movie/repositories/movie_repository.dart';

class DataMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieRemoteDatasource>(
      () => MovieRemoteDatasourceImpl(
        Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<MovieRepository>(
      () => MovieRepositoryImpl(
        Get.find(),
      ),
      fenix: true,
    );
  }
}
