import 'package:get/get.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/domain/movie/repositories/movie_repository.dart';

class PopularWidgetController extends GetxController {
  MovieRepository movieRepository;

  PopularWidgetController(this.movieRepository);

  final isLoading = true.obs;
  final nowPlaying = <Movie>[].obs;
  final index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    nowPlaying.addAll(List.generate(5, (index) => Movie()));
    retrievePopular();
  }

  onRefresh() {
    index.value = 0;
    nowPlaying.clear();
    nowPlaying.addAll(List.generate(5, (index) => Movie()));
    retrievePopular();
  }

  Future<void> retrievePopular() async {
    isLoading(true);
    final result = await movieRepository.retrievePopular();
    result.fold((failure) {}, (data) {
      nowPlaying.value = data;
    });
    isLoading(false);
  }

  changeIndex(int index) {
    this.index.value = index;
  }
}
