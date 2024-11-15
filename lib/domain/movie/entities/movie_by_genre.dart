import 'package:xsis/domain/movie/entities/movie.dart';

class MovieByGenre {
  final List<Movie> movies;
  final int page;
  final int totalPage;

  MovieByGenre({this.movies = const [], this.page = 1, this.totalPage = 1});

  MovieByGenre copyWith({
    List<Movie>? movies,
    int? page,
    int? totalPage,
  }) {
    return MovieByGenre(
        movies: movies ?? this.movies,
        page: page ?? this.page,
        totalPage: totalPage ?? this.totalPage);
  }
}
