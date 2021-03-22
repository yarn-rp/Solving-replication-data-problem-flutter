part of 'a_bloc.dart';

@immutable
abstract class AState {
  final int count;

  AState(this.count);
}

class ACounterState extends AState {
  final int count;

  ACounterState(this.count) : super(count);
}
