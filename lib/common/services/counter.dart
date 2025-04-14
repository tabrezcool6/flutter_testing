/// counter class to manage the counter state
/// and provide methods to increment, decrement and reset the counter
class Counter {
  int _counter = 0;
  int get count => _counter;

  /// increment method to increment the counter by 1
  void increment() {
    _counter++;
  }

  /// decrement method to decrement the counter by 1
  void decrement() {
    _counter--;
  }

  /// reset method to reset the counter to 0
  void reset() {
    _counter = 0;
  }

  /// increment method to increment the counter by 1
  void incrementBy2() {
    _counter += 2;
  }

  /// decrement method to decrement the counter by 1
  void decrementBy2() {
    _counter -= 2;
  }
}
