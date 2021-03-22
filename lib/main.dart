import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_A/a_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_B/b_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_C/c_bloc.dart';

import 'package:replication_data_problem_solution/src/dependency_injection/injection_container.dart';
import 'package:replication_data_problem_solution/src/pages/page_A.dart';
import 'package:replication_data_problem_solution/src/pages/page_B.dart';
import 'package:replication_data_problem_solution/src/pages/page_C.dart';

void main() async {
  await initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Replication data problem Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<ABloc>(create: (context) => sl<ABloc>()),
        BlocProvider<BBloc>(create: (context) => sl<BBloc>()),
        BlocProvider<CBloc>(create: (context) => sl<CBloc>()),
      ], child: MyHomePage()),
    );
  }
}

/// This is an example Widget to demonstrate my solution for Replication problem.
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        sl<PageA>(),
        sl<PageB>(),
        sl<PageC>(),
      ],
    );
  }
}
