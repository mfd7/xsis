import 'package:get/get.dart';
import 'package:xsis/domain/genre/entities/genre.dart';
import 'package:xsis/domain/genre/repositories/genre_repository.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/domain/movie/entities/movie_by_genre.dart';
import 'package:xsis/domain/movie/repositories/movie_repository.dart';

class GenreWidgetController extends GetxController {
  final MovieRepository movieRepository;
  final GenreRepository genreRepository;

  GenreWidgetController(this.movieRepository, this.genreRepository);

  final genreList = <Genre>[].obs;
  final selectedGenreIdx = 0.obs;
  final movieByGenre = MovieByGenre().obs;
  final isLoading = false.obs;
  final isGenreLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    movieByGenre.value = movieByGenre.value
        .copyWith(movies: List.generate(5, (index) => Movie()));
    initData();
  }

  initData() async {
    await retrieveGenres();
    retrieveMoviesByGenre();
  }

  Future<void> retrieveGenres() async {
    isGenreLoading(true);
    final result = await genreRepository.retrieveGenreList();
    result.fold((failure) {}, (data) {
      genreList.value = data;
    });
    isGenreLoading(false);
  }

  Future<void> retrieveMoviesByGenre({bool isLoadMore = false}) async {
    int page = 1;
    if (!isLoadMore) {
      isLoading(true);
    } else {
      page = movieByGenre.value.page + 1;
    }
    final result = await movieRepository.retrieveMovieByGenre(
        genreList[selectedGenreIdx.value].id, page);
    result.fold((failure) {}, (data) {
      if (!isLoadMore) {
        movieByGenre.value = data;
      } else {
        List<Movie> addedMovies = List.from(movieByGenre.value.movies);
        addedMovies.addAll(data.movies);
        movieByGenre.value =
            movieByGenre.value.copyWith(movies: addedMovies, page: page);
      }
    });
    isLoading(false);
  }

  changeGenre(int index) {
    selectedGenreIdx.value = index;
    retrieveMoviesByGenre();
  }
}
