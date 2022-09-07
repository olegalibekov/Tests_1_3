import 'dart:math';

import 'argument_exception.dart';
import 'const.dart';
import 'extension.dart';

class Equation {
  List<double> solve(double a, double b, double c) {
    if (a.abs() < Constants.epsilon) throw ArgumentException('First argument "a" is 0.0');
    if ([a, b, c].firstWhereOrNull((element) => element.isInfinite || element.isNaN) != null) {
      throw ArgumentException('Argument contains inappropriate value (infinite or NaN)');
    }
    final D = b * b - 4 * a * c;
    if (D.abs() < Constants.epsilon) {
      final x1 = (-b) / (2 * a);
      return [x1, x1];
    }
    if (D < 0) return [];
    final x1 = (-b + sqrt(D)) / (2 * a);
    final x2 = (-b - sqrt(D)) / (2 * a);
    return [x1, x2];
  }
}
