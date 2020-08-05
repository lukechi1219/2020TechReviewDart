# clean_architecture_tdd_final

Clean Architecture +TDD

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# alt + ins
dart
lib\features\number_trivia\domain\entities\number_trivia.dart
class NumberTrivia extends Equatable {}
# F2
# alt + shift + enter
final String text;
final int number;
# F2
# alt + shift + enter
@override
List<Object> get props => [text, number];

# alt + ins
dart
test\features\number_trivia\domain\usecases\get_concrete_number_trivia_test.dart
class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}
# F2
# alt + shift + enter
# F2
# alt + shift + enter
# alt + ins
dart
lib\features\number_trivia\domain\repositories\number_trivia_repository.dart
abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
# F2
# alt + shift + enter
# F2
# alt + shift + enter
# alt + ins
dart
lib\core\error\failure.dart
class Failure {
}
# testmain
# tab
should get trivia for the number from the repository
# alt + shift + enter
  MockNumberTriviaRepository mockNumberTriviaRepository;
  GetConcreteNumberTrivia usecase;
# F2
# alt + shift + enter
# alt + ins
dart
lib\features\number_trivia\domain\usecases\get_concrete_number_trivia.dart
class GetConcreteNumberTrivia {}
  final NumberTriviaRepository repository;
# F2
# alt + shift + enter
# F2
# alt + shift + enter




