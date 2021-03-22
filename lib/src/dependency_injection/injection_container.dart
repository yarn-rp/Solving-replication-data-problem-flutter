import 'package:get_it/get_it.dart';
import 'package:replication_data_problem_solution/src/bloc_A/a_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_B/b_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_C/c_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_handler/increment_handler.dart';
import 'package:replication_data_problem_solution/src/pages/page_A.dart';
import 'package:replication_data_problem_solution/src/pages/page_B.dart';
import 'package:replication_data_problem_solution/src/pages/page_C.dart';

/// This is the Service Locator. It's an instance of GetIt.instance
final sl = GetIt.instance;

/// Init all project dependencies
Future<void> initDependencies() async {
  IncrementHandlerComponent _incrementHandlerComponent =
      await _initIncrementHandlerComponent();
  _initBlocs(_incrementHandlerComponent.messages);
  _initPages(_incrementHandlerComponent.incrementCounter);
}

/// Initialize the [incrementHandlerComponent] component as a Singleton .
///
/// Returns an instance of [incrementHandlerComponent]
/// to avoid multiples calls to [get_it.instance\<IncrementHandlerComponent\>()].
Future<IncrementHandlerComponent> _initIncrementHandlerComponent() async {
  sl.registerLazySingleton(
    () => IncrementHandlerComponent(),
  );

  /// It's an instance of the incrementHandler component that we are going to inject to dependencies.
  return sl<IncrementHandlerComponent>();
}

/// Register all BLoCs used in the the app injecting them the [_incrementHandlerComponent.messages]
/// stream instance.
Future<void> _initBlocs(Stream _messagesStream) async {
  sl.registerFactory(() => ABloc(
        0,
        _messagesStream,
      ));
  sl.registerFactory(() => BBloc(
        0,
        _messagesStream,
      ));
  sl.registerFactory(() => CBloc(
        0,
        _messagesStream,
      ));
}

/// Register all pages in the app injecting them the [incrementFunction] that should
/// be called when a [Increment Counter for all Pages] button is tapped
Future<void> _initPages(
    void Function(int incrementNumber) incrementFunction) async {
  // Pages registration with the incrementCounterFunction function injected. You can also inject Blocs, but I like to use
  sl.registerLazySingleton(
      () => PageA(incrementCounterFunction: incrementFunction));
  sl.registerLazySingleton(
      () => PageB(incrementCounterFunction: incrementFunction));
  sl.registerLazySingleton(
      () => PageC(incrementCounterFunction: incrementFunction));
}
