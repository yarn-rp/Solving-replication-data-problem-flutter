import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:replication_data_problem_solution/src/bloc_handler/increment_handler.dart';

part 'c_event.dart';
part 'c_state.dart';

class CBloc extends Bloc<CEvent, CState> {
  StreamSubscription subscription;
  CBloc(int count, Stream incrementMessages) : super(CInitial(count)) {
    subscription = incrementMessages.listen((event) {
      _onRecieveData(event);
    });
  }
  void _onRecieveData(int event) {
    print("just recieve an Incrementation Event in ABloc");
    add(CIncrement());
  }

  @override
  Stream<CState> mapEventToState(
    CEvent event,
  ) async* {
    if (event is CIncrement) {
      yield CInitial(state.count + 1);
    }
  }
}
