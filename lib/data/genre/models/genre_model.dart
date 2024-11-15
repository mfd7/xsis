
import 'package:xsis/domain/genre/entities/genre.dart';

/// id : 28
/// name : "Action"

class GenreModel {
  GenreModel({
    num? id,
    String? name,
  }) {
    _id = id;
    _name = name;
  }

  GenreModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;
  GenreModel copyWith({
    num? id,
    String? name,
  }) =>
      GenreModel(
        id: id ?? _id,
        name: name ?? _name,
      );
  num get id => _id ?? 0;
  String get name => _name ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

  Genre toEntity() {
    return Genre(id: id.toInt(), name: name);
  }
}
