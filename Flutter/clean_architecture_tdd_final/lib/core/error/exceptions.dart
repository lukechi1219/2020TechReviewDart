import 'package:dartz/dartz.dart';

import 'failures.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

Future<Either<Failure, T>> catchException<T>(
    Function functionBody, int number) async {
  try {
    return await functionBody(number);
  } on ServerException {
    return Left(ServerFailure());
  }
}
