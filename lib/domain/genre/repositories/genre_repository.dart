import 'package:dartz/dartz.dart';
import 'package:xsis/domain/_core/app_failures.dart';
import 'package:xsis/domain/genre/entities/genre.dart';

abstract class GenreRepository {
  Future<Either<AppFailure, List<Genre>>> retrieveGenreList();
}
