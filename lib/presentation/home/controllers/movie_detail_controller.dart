import 'package:get/get.dart';
import 'package:xsis/domain/genre/entities/genre.dart';
import 'package:xsis/domain/genre/repositories/genre_repository.dart';
import 'package:xsis/domain/movie/repositories/movie_repository.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MovieDetailController extends GetxController {
  final GenreRepository genreRepository;
  final MovieRepository movieRepository;
  final isGenreLoading = false.obs;
  final isLoading = false.obs;
  final genreList = <Genre>[].obs;
  Rx<YoutubePlayerController?> videoController = Rx(null);

  MovieDetailController(
      this.genreRepository, this.movieRepository, this.movieId);

  final int movieId;

  @override
  void onInit() {
    super.onInit();
    retrieveGenres();
    retrieveVideos();
  }

  Future<void> retrieveGenres() async {
    isGenreLoading(true);
    final result = await genreRepository.retrieveGenreList();
    result.fold((failure) {}, (data) {
      genreList.value = data;
    });
    isGenreLoading(false);
  }

  Future<void> retrieveVideos() async {
    isLoading(true);
    final result = await movieRepository.retrieveVideos(movieId);
    result.fold((failure) {}, (data) {
      final video = data.firstWhere((e) =>
          e.type.toLowerCase() == 'trailer' &&
          e.site.toLowerCase() == 'youtube');
      videoController.value = YoutubePlayerController.fromVideoId(
        videoId: video.key,
        autoPlay: false,
        params: const YoutubePlayerParams(
          mute: false,
          showControls: true,
          showFullscreenButton: true,
        ),
      );
      videoController.value!.setFullScreenListener((val) async {
        final startSeconds = await videoController.value!.currentTime;
        if (val) {
          Get.to(
            () => FullscreenYoutubePlayer(
              videoId: video.key,
              startSeconds: startSeconds,
            ),
          );
        } else {
          Get.back();
        }
      });
    });
    isLoading(false);
  }
}
