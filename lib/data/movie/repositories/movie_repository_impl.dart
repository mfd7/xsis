import 'package:dartz/dartz.dart';
import 'package:xsis/_core/extensions.dart';
import 'package:xsis/_core/utils/logger.dart';
import 'package:xsis/data/_core/app_exceptions.dart';
import 'package:xsis/data/movie/datasources/movie_remote_datasource.dart';
import 'package:xsis/domain/_core/app_failures.dart';
import 'package:xsis/domain/movie/entities/movie.dart';
import 'package:xsis/domain/movie/entities/movie_by_genre.dart';
import 'package:xsis/domain/movie/entities/movie_video.dart';
import 'package:xsis/domain/movie/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource remoteDatasource;

  MovieRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<AppFailure, MovieByGenre>> retrieveMovieByGenre(
      int? genreId, int page) async {
    try {
      final result =
          await remoteDatasource.retrieveMoviesByGenre(genreId, page);
      return Right(result.toEntity());
    } on AppException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return const Left(AppFailure.general("Unknown Error"));
    }
  }

  @override
  Future<Either<AppFailure, List<Movie>>> retrieveNowPlayingList() async {
    try {
      final result = await remoteDatasource.retrieveNowPlaying();
      return Right(result.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return const Left(AppFailure.general("Unknown Error"));
    }
  }

  @override
  Future<Either<AppFailure, List<Movie>>> retrievePopular() async {
    try {
      final result = await remoteDatasource.retrievePopular();
      return Right(result.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return const Left(AppFailure.general("Unknown Error"));
    }
  }

  @override
  Future<Either<AppFailure, List<Movie>>> searchMovie(
      String query, int page) async {
    try {
      final result = await remoteDatasource.searchMovie(query, page);
      return Right(result.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return const Left(AppFailure.general("Unknown Error"));
    }
  }

  @override
  Future<Either<AppFailure, List<MovieVideo>>> retrieveVideos(
      int movieId) async {
    try {
      final result = await remoteDatasource.retrieveVideos(movieId);
      return Right(result.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return const Left(AppFailure.general("Unknown Error"));
    }
  }
}
