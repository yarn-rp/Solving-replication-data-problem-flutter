import 'dart:async';

/// This is the main Component of our app. Usually this handles a lot of logic, but for the purpose of
/// this example we keep it very simple.
///
///In here you should do all your logic, handle errors and notify the [subscriptors] about the state of the action
/// A very good practice is notify the [suscriptors] about every State of the given action to perform.
/// For example, if, the action to perform is asynchonus, you should notify your [subscriptors]
/// that you recieved an action and it's going to take a while to get finished, just in case the [subscriptor]
/// needs to show a Loading animation. When the action finishes, then you notify them again that the
/// action just finished properly or some error happend.
class IncrementHandlerComponent {
  final StreamController<int> counterController =
      StreamController<int>.broadcast();

  Stream<int> get messages => counterController.stream;

  void incrementCounter(int changeCounters) =>
      counterController.sink.add(changeCounters);

  dispose() {
    counterController.close();
  }
}
