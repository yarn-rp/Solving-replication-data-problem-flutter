import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:replication_data_problem_solution/src/bloc_handler/increment_handler.dart';

part 'a_event.dart';
part 'a_state.dart';

class ABloc extends Bloc<AEvent, AState> {
  StreamSubscription subscription;

  ABloc(int count, Stream incrementMessages) : super(ACounterState(count)) {
    subscription = incrementMessages.listen((event) {
      _onRecieveData(event);
    });
  }

  void _onRecieveData(int event) {
    add(AIncrement());
  }

  @override
  Stream<AState> mapEventToState(
    AEvent event,
  ) async* {
    if (event is AIncrement) {
      yield ACounterState(state.count + 1);
    }
  }
}
