import 'package:xsis/domain/movie/entities/movie.dart';

/// adult : false
/// backdrop_path : "/vdpE5pjJVql5aD6pnzRqlFmgxXf.jpg"
/// genre_ids : [18,36]
/// id : 906126
/// original_language : "es"
/// original_title : "La sociedad de la nieve"
/// overview : "On October 13, 1972, Uruguayan Air Force Flight 571, chartered to take a rugby team to Chile, crashes into a glacier in the heart of the Andes."
/// popularity : 1435.957
/// poster_path : "/k7rEpZfNPB35FFHB00ZhXHKTL7X.jpg"
/// release_date : "2023-12-13"
/// title : "Society of the Snow"
/// video : false
/// vote_average : 8.139
/// vote_count : 512

class MovieModel {
  MovieModel({
    bool? adult,
    String? backdropPath,
    List<num>? genreIds,
    num? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) {
    _adult = adult;
    _backdropPath = backdropPath;
    _genreIds = genreIds;
    _id = id;
    _originalLanguage = originalLanguage;
    _originalTitle = originalTitle;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _releaseDate = releaseDate;
    _title = title;
    _video = video;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
  }

  MovieModel.fromJson(dynamic json) {
    _adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _id = json['id'];
    _originalLanguage = json['original_language'];
    _originalTitle = json['original_title'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    _releaseDate = json['release_date'];
    _title = json['title'];
    _video = json['video'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  bool? _adult;
  String? _backdropPath;
  List<num>? _genreIds;
  num? _id;
  String? _originalLanguage;
  String? _originalTitle;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  String? _releaseDate;
  String? _title;
  bool? _video;
  num? _voteAverage;
  num? _voteCount;
  MovieModel copyWith({
    bool? adult,
    String? backdropPath,
    List<num>? genreIds,
    num? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    num? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    num? voteAverage,
    num? voteCount,
  }) =>
      MovieModel(
        adult: adult ?? _adult,
        backdropPath: backdropPath ?? _backdropPath,
        genreIds: genreIds ?? _genreIds,
        id: id ?? _id,
        originalLanguage: originalLanguage ?? _originalLanguage,
        originalTitle: originalTitle ?? _originalTitle,
        overview: overview ?? _overview,
        popularity: popularity ?? _popularity,
        posterPath: posterPath ?? _posterPath,
        releaseDate: releaseDate ?? _releaseDate,
        title: title ?? _title,
        video: video ?? _video,
        voteAverage: voteAverage ?? _voteAverage,
        voteCount: voteCount ?? _voteCount,
      );
  bool get adult => _adult ?? false;
  String get backdropPath => _backdropPath ?? '';
  List<num> get genreIds => _genreIds ?? [];
  num get id => _id ?? 0;
  String get originalLanguage => _originalLanguage ?? '';
  String get originalTitle => _originalTitle ?? '';
  String get overview => _overview ?? '';
  num get popularity => _popularity ?? 0;
  String get posterPath => _posterPath ?? '';
  String get releaseDate => _releaseDate ?? '';
  String get title => _title ?? '';
  bool get video => _video ?? false;
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['backdrop_path'] = _backdropPath;
    map['genre_ids'] = _genreIds;
    map['id'] = _id;
    map['original_language'] = _originalLanguage;
    map['original_title'] = _originalTitle;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    map['release_date'] = _releaseDate;
    map['title'] = _title;
    map['video'] = _video;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

  Movie toEntity() {
    return Movie(
      id: id.toInt(),
      title: title,
      imageUrl: posterPath,
      backdropUrl: backdropPath,
      releaseDate: releaseDate.isNotEmpty ? DateTime.parse(releaseDate) : null,
      overview: overview,
      genreIds: genreIds.map((e) => e.toInt()).toList(),
    );
  }
}
