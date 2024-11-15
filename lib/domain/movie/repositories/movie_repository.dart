import 'package:dartz/dartz.dart';
import 'package:xsis/domain/_core/app_failures.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/domain/movie/entities/movie_by_genre.dart';
import 'package:xsis/domain/movie/entities/movie_video.dart';

abstract class MovieRepository {
  Future<Either<AppFailure, List<Movie>>> retrieveNowPlayingList();
  Future<Either<AppFailure, MovieByGenre>> retrieveMovieByGenre(
      int? genreId, int page);
  Future<Either<AppFailure, List<Movie>>> retrievePopular();
  Future<Either<AppFailure, List<Movie>>> searchMovie(String query, int page);
  Future<Either<AppFailure, List<MovieVideo>>> retrieveVideos(int movieId);
}
