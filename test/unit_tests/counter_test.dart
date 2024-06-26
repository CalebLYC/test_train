import 'package:flutter_test/flutter_test.dart';
import 'package:test_train/counter.dart';

void main() {
  group("All counter states: start, increment, decrement", () {
    test("Counter value should be started", () {
      expect(Counter().value, 0);
    });
    test("Counter value should be incremented", () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });
    test("Counter value should be decremented", () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
