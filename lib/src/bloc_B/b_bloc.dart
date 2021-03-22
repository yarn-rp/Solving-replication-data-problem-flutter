import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:replication_data_problem_solution/src/bloc_A/a_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_handler/increment_handler.dart';

part 'b_event.dart';
part 'b_state.dart';

class BBloc extends Bloc<BEvent, BState> {
  StreamSubscription subscription;
  BBloc(int count, Stream incrementMessages) : super(BInitial(count)) {
    subscription = incrementMessages.listen((event) {
      _onRecieveData(event);
    });
  }

  void _onRecieveData(int event) {
    print("just recieve an Incrementation Event in ABloc");
    add(BIncrement());
  }

  @override
  Stream<BState> mapEventToState(
    BEvent event,
  ) async* {
    if (event is BIncrement) {
      yield BInitial(state.count + 1);
    }
  }
}
