import 'package:counter_widget_testing/common/services/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// initialize the counter object
  late Counter counter;

  /// This method is called before each test
  /// since we need counter object in each test, instead of creating
  /// counter object in each test, we can create it here.
  /// It gives brand new instance for every new test.
  /// You can initialize any required resources here
  setUp(() {
    counter = Counter();
  });

  /// grouping all the tests related to home counter class
  /// comes handy when we have multiple tests for each feature
  /// and we can run all the tests of single feature at once by single command
  group('Home Counter Unit Test - ', () {
    /// test to check if the counter is initialized to 0
    /// if the counter is initialized to 0 the test will pass
    test(
      'given counter is class, when counter is initialized then counter should be 0',
      () {
        final count = counter.count;
        expect(count, 0);
      },
    );

    /// test to check if the counter is incremented to 1 from the initial value 0
    /// if the counter is incremented to 1 the test will pass
    test(
      'given counter class, when counter is incremented then counter should be 1',
      () {
        counter.increment();
        final count = counter.count;
        expect(count, 1);
      },
    );

    /// test to check if the counter is decremented to -1 from the initial value 0
    /// if the counter is decremented to -1 the test will pass
    test(
      'given counter class, when counter is decremented then counter should be -1',
      () {
        counter.decrement();
        final count = counter.count;
        expect(count, -1);
      },
    );

    /// test to check if the counter is reset to 0 from the existing value
    /// if the counter is reset to 0 the test will pass
    test(
      'given counter class, when counter is reset then the counter should be 0',
      () {
        counter.reset();
        final count = counter.count;
        expect(count, 0);
      },
    );
  });
}


/// this is the old code where we are not using setUp method and using 
/// and initializing Counter object in each test

/*

/// Inital Simple Method
void main() {
  test(
    'given counter is class, when counter is initialized then counter should be 0',
    () {
      final Counter counter = Counter();
      final count = counter.count;
      expect(count, 0);
    },
  );

  test(
    'given counter class, when counter is incremented then counter should be 1',
    () {
      final Counter counter = Counter();
      counter.increment();
      final count = counter.count;
      expect(count, 1);
    },
  );

  test(
    'given counter class, when counter is incremented then counter should be 1',
    () {
      final Counter counter = Counter();
      counter.decrement();
      final count = counter.count;
      expect(count, -1);
    },
  );
}

 */