import 'package:dartz/dartz.dart';

import 'failures.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

typedef Future<Right<Failure, T>> _ConcreteOrRandomChooser<T>(int number);

Future<Either<Failure, T>> catchServerException<T>(
    _ConcreteOrRandomChooser<T> functionBody, int number) async {
  try {
    return await functionBody(number);
  } on ServerException {
    return Left(ServerFailure());
  }
}

Future<Either<Failure, T>> catchCacheException<T>(
    _ConcreteOrRandomChooser<T> functionBody) async {
  try {
    return await functionBody(0);
  } on CacheException {
    return Left(CacheFailure());
  }
}
