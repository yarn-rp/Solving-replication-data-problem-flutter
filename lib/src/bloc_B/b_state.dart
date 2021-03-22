part of 'b_bloc.dart';

@immutable
abstract class BState {
  final int count;

  BState(this.count);
}

class BInitial extends BState {
  BInitial(int count) : super(count);
}
