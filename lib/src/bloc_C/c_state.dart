part of 'c_bloc.dart';

@immutable
abstract class CState {
  final int count;

  CState(this.count);
}

class CInitial extends CState {
  CInitial(int count) : super(count);
}
