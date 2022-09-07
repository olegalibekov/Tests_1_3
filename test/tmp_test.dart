import 'package:test/test.dart';

import '../project/argument_exception.dart';
import '../project/equation.dart';

void main() {
  group('Quadratic equation tests', () {
    final quadraticEquation = Equation();
    test('x^2+1=0 -> no roots', () {
      expect(quadraticEquation.solve(1, 0, 1), equals([]));
    });
    test('x^2-1=0 -> two roots of multiplicity 1 (x1=1, x2=-1)', () {
      expect(quadraticEquation.solve(1, 0, -1), equals([1.0, -1.0]));
    });
    test('7x^2+56x-112=0 -> one root of multiplicity 2 (x1=x2=4)', () {
      expect(quadraticEquation.solve(7, -56, 112), equals([4, 4]));
    });
    test('a==0 -> throw exception', () {
      expect(() => quadraticEquation.solve(0, 1, 1), throwsA(isA<ArgumentException>()));
    });

    group('', () {
      test('a is infinity -> throw exception', () {
        expect(() => quadraticEquation.solve(double.infinity, 1, 1),
            throwsA(isA<ArgumentException>()));
      });
      test('a is NaN -> throw exception', () {
        expect(() => quadraticEquation.solve(double.nan, 1, 1),
            throwsA(isA<ArgumentException>()));
      });

      test('b is infinity -> throw exception', () {
        expect(() => quadraticEquation.solve(1, double.nan, 1),
            throwsA(isA<ArgumentException>()));
      });
      test('b is NaN -> throw exception', () {
        expect(() => quadraticEquation.solve(1, double.nan, 1),
            throwsA(isA<ArgumentException>()));
      });

      test('c is infinity -> throw exception', () {
        expect(() => quadraticEquation.solve(1, 1, double.nan),
            throwsA(isA<ArgumentException>()));
      });
      test('c is NaN -> throw exception', () {
        expect(() => quadraticEquation.solve(1, 1, double.nan),
            throwsA(isA<ArgumentException>()));
      });
    });
  });
}
