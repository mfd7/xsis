import 'package:xsis/data/_core/api_base_helper.dart';
import 'package:xsis/data/movie/models/movie_by_genre_model.dart';
import 'package:xsis/data/movie/models/movie_model.dart';
import 'package:xsis/data/movie/models/movie_video_model.dart';
import 'package:xsis/data/movie/movie_endpoints.dart';

abstract class MovieRemoteDatasource {
  Future<List<MovieModel>> retrieveNowPlaying();
  Future<MovieByGenreModel> retrieveMoviesByGenre(int? genreId, int page);
  Future<List<MovieModel>> retrievePopular();
  Future<List<MovieModel>> searchMovie(String query, int page);
  Future<List<MovieVideoModel>> retrieveVideos(int movieId);
}

class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final ApiBaseHelper apiBaseHelper;

  MovieRemoteDatasourceImpl(this.apiBaseHelper);

  @override
  Future<List<MovieModel>> retrieveNowPlaying() async {
    final responseBody = await apiBaseHelper.getApi(MovieEndpoints.nowPlaying);
    final List<dynamic> data = responseBody['results'] as List<dynamic>;
    final List<MovieModel> list = data
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  @override
  Future<MovieByGenreModel> retrieveMoviesByGenre(
      int? genreId, int page) async {
    final responseBody =
        await apiBaseHelper.getApi(MovieEndpoints.movieByGenre, query: {
      'with_genres': genreId != null ? genreId.toString() : '',
      'page': page.toString()
    });
    final data = MovieByGenreModel.fromJson(responseBody);
    return data;
  }

  @override
  Future<List<MovieModel>> retrievePopular() async {
    final responseBody = await apiBaseHelper.getApi(MovieEndpoints.popular);
    final List<dynamic> data = responseBody['results'] as List<dynamic>;
    final List<MovieModel> list = data
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  @override
  Future<List<MovieModel>> searchMovie(String query, int page) async {
    final responseBody =
        await apiBaseHelper.getApi(MovieEndpoints.search, query: {
      'query': query,
      'page': page.toString(),
      'include_adult': true.toString(),
    });
    final List<dynamic> data = responseBody['results'] as List<dynamic>;
    final List<MovieModel> list = data
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }

  @override
  Future<List<MovieVideoModel>> retrieveVideos(int movieId) async {
    final responseBody =
        await apiBaseHelper.getApi('${MovieEndpoints.video}$movieId/videos');
    final List<dynamic> data = responseBody['results'] as List<dynamic>;
    final List<MovieVideoModel> list = data
        .map((e) => MovieVideoModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }
}
