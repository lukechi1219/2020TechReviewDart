import 'package:dartz/dartz.dart';

import 'failures.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

typedef Future<Right<Failure, T>> _function<T>(List params);

Future<Either<Failure, T>> catchServerException<T>(
    _function<T> functionBody, List params) async {
  try {
    return await functionBody(params);
  } on ServerException {
    return Left(ServerFailure());
  }
}

Future<Either<Failure, T>> catchCacheException<T>(
    _function<T> functionBody) async {
  try {
    return await functionBody([0]);
  } on CacheException {
    return Left(CacheFailure());
  }
}
