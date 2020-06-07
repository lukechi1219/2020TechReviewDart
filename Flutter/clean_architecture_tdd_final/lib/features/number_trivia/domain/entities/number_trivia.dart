import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class NumberTrivia extends Equatable {
  final int number;
  final String text;

  /**
   * {this.text} will enable named parameter
   * @required will force named parameter required
   */
  NumberTrivia({
    @required this.number,
    @required this.text,
  });

  @override
  List<Object> get props => [text, number];
}
