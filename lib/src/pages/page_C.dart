import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_C/c_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_handler/increment_handler.dart';

class PageC extends StatefulWidget {
  final void Function(int incrementNumber) incrementCounterFunction;

  const PageC({Key key, @required this.incrementCounterFunction})
      : super(key: key);
  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageC> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CBloc, CState>(
      builder: (context, state) {
        print("New state from C");
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lime[800],
            title: Text("Page C"),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: FloatingActionButton.extended(
              onPressed: () => widget.incrementCounterFunction(state.count + 1),
              tooltip: 'Increment',
              backgroundColor: Colors.lime[800],
              label: Text('Increment Counter for all Pages'),
            ),
          ),
          body: Center(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter in Page C is :",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "${state.count}",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
