import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  /**
   * {this.text} will enable named parameter
   * @required will force named parameter required
   */
  NumberTrivia({
    @required this.text,
    @required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
