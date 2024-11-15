import 'package:xsis/data/_core/api_base_helper.dart';
import 'package:xsis/data/genre/genre_endpoints.dart';
import 'package:xsis/data/genre/models/genre_model.dart';

abstract class GenreRemoteDatasource {
  Future<List<GenreModel>> retrieveGenres();
}

class GenreRemoteDatasourceImpl implements GenreRemoteDatasource {
  final ApiBaseHelper apiBaseHelper;

  GenreRemoteDatasourceImpl(this.apiBaseHelper);

  @override
  Future<List<GenreModel>> retrieveGenres() async {
    final responseBody = await apiBaseHelper.getApi(GenreEndpoints.genreList);
    final List<dynamic> data = responseBody['genres'] as List<dynamic>;
    final List<GenreModel> list = data
        .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return list;
  }
}
