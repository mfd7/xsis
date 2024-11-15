import 'package:get/get.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/domain/movie/repositories/movie_repository.dart';

class LatestWidgetController extends GetxController {
  MovieRepository movieRepository;

  LatestWidgetController(this.movieRepository);

  final latestMovies = <Movie>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    latestMovies.addAll(List.generate(5, (index) => Movie()));
    retrieveLatest();
  }

  Future<void> retrieveLatest() async {
    isLoading(true);
    final result = await movieRepository.retrieveNowPlayingList();
    result.fold((failure) {}, (data) {
      latestMovies.value = data;
    });
    isLoading(false);
  }
}
