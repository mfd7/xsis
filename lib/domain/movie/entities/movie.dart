class Movie {
  final int id;
  final String title;
  final String imageUrl;
  final String backdropUrl;
  final DateTime? releaseDate;
  final String overview;
  final List<int> genreIds;

  Movie({
    this.id = 0,
    this.title = '',
    this.imageUrl = '',
    this.backdropUrl = '',
    this.releaseDate,
    this.overview = '',
    this.genreIds = const [],
  });
}
