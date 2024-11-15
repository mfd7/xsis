import 'package:dartz/dartz.dart';
import 'package:xsis/_core/extensions.dart';
import 'package:xsis/data/_core/app_exceptions.dart';
import 'package:xsis/data/genre/datasources/genre_remote_datasource.dart';
import 'package:xsis/domain/_core/app_failures.dart';
import 'package:xsis/domain/genre/entities/genre.dart';
import 'package:xsis/domain/genre/repositories/genre_repository.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreRemoteDatasource remoteDatasource;

  GenreRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<AppFailure, List<Genre>>> retrieveGenreList() async {
    try {
      final result = await remoteDatasource.retrieveGenres();
      return Right(result.map((e) => e.toEntity()).toList());
    } on AppException catch (e) {
      return Left(e.toAppFailure());
    } catch (e) {
      return const Left(AppFailure.general("Unknown Error"));
    }
  }
}
