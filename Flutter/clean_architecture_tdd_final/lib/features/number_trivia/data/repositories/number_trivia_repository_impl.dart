import 'dart:async';

import 'package:clean_architecture_tdd_course/core/error/exceptions.dart';
import 'package:clean_architecture_tdd_course/core/error/failures.dart';
import 'package:clean_architecture_tdd_course/core/platform/network_info.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

typedef Future<Right<Failure, T>> _ConcreteOrRandomChooser<T>(List params);

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    return await _getTrivia(_getConcreteNumberTrivia, number);
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    return await _getTrivia(_getRandomNumberNumberTrivia, 0);
  }

  Future<Either<Failure, NumberTrivia>> _getTrivia(
      _ConcreteOrRandomChooser<NumberTrivia> getConcreteOrRandom,
      int number) async {
    //
    if (await networkInfo.isConnected) {
      return catchServerException<NumberTrivia>(getConcreteOrRandom, [number]);
    }
    return catchCacheException<NumberTrivia>(_getLastNumberTriviaInCache);
  }

  Future<Right<Failure, NumberTrivia>> _getConcreteNumberTrivia(
      List params) async {
    final remoteTrivia = await remoteDataSource.getConcreteNumberTrivia(params[0]);
    localDataSource.cacheNumberTrivia(remoteTrivia);
    return Right(remoteTrivia);
  }

  Future<Right<Failure, NumberTrivia>> _getRandomNumberNumberTrivia(
      List params) async {
    final remoteTrivia = await remoteDataSource.getRandomNumberTrivia();
    localDataSource.cacheNumberTrivia(remoteTrivia);
    return Right(remoteTrivia);
  }

  Future<Right<Failure, NumberTrivia>> _getLastNumberTriviaInCache(
      List params) async {
    final localTrivia = await localDataSource.getLastNumberTrivia();
    return Right(localTrivia);
  }
}
