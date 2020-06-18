import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NuberTriviaEvent extends Equatable {}

class GetTriviaForConcreteNumber extends NuberTriviaEvent {
  final String numberString;

  GetTriviaForConcreteNumber({
    @required this.numberString,
  });

  @override
  List<Object> get props => [numberString];
}

class GetTriviaForRandomNumber extends NuberTriviaEvent {
  @override
  List<Object> get props => const <dynamic>[];
}
