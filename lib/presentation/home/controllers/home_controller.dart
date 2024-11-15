import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/domain/movie/repositories/movie_repository.dart';
import 'package:xsis/presentation/home/controllers/genre_widget_controller.dart';
import 'package:xsis/presentation/home/controllers/latest_widget_controller.dart';
import 'package:xsis/presentation/home/controllers/movie_detail_controller.dart';
import 'package:xsis/presentation/home/controllers/popular_widget_controller.dart';
import 'package:xsis/presentation/home/widgets/movie_detail_bottom_sheet.dart';

class HomeController extends GetxController {
  final MovieRepository movieRepository;

  HomeController(this.movieRepository);

  final genreScrollController = ScrollController();
  final isSearching = false.obs;
  final isTyping = false.obs;
  final searchController = TextEditingController();
  final isLoading = false.obs;
  final searchedMovies = <Movie>[].obs;
  final searchFocusNode = FocusNode();
  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    genreScrollController.addListener(_onScroll);
  }

  @override
  void onClose() {
    genreScrollController.removeListener(_onScroll);
    super.onClose();
  }

  Future<void> searchMovie() async {
    isLoading(true);
    final result = await movieRepository.searchMovie(searchController.text, 1);
    result.fold((failure) {}, (data) {
      searchedMovies.value = data;
    });
    isLoading(false);
  }

  performSearch() {
    if (searchController.text.isNotEmpty) {
      isTyping(true);
    }
    if (_debounce != null) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(seconds: 1), () {
      searchMovie();
    });
  }

  void _onScroll() {
    if (genreScrollController.position.pixels ==
        genreScrollController.position.maxScrollExtent) {
      final genreController = Get.find<GenreWidgetController>();
      if (genreController.isLoading.isFalse) {
        genreController.retrieveMoviesByGenre(isLoadMore: true);
      }
    }
  }

  toggleSearch(BuildContext context) async {
    isSearching(!isSearching.value);
    if (isSearching.value) {
      await Future.delayed(const Duration(milliseconds: 200), () {
        if (context.mounted) {
          FocusScope.of(context).requestFocus(searchFocusNode);
        }
      });
    }
  }

  clearSearch() {
    searchController.clear();
    searchedMovies.clear();
    isTyping(false);
  }

  Future<void> onRefresh() async {
    final popularController = Get.find<PopularWidgetController>();
    final latestController = Get.find<LatestWidgetController>();
    final genreController = Get.find<GenreWidgetController>();

    popularController.onRefresh();
    latestController.retrieveLatest();
    genreController.retrieveMoviesByGenre();
  }

  openMovieDetails(Movie movie) async {
    await Get.bottomSheet(
      MovieDetailBottomSheet(
        movie: movie,
      ),
      ignoreSafeArea: false,
      isScrollControlled: true,
    );
    Get.delete<MovieDetailController>();
  }
}
