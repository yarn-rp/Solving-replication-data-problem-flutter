import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_A/a_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_handler/increment_handler.dart';

class PageA extends StatefulWidget {
  final void Function(int incrementNumber) incrementCounterFunction;

  const PageA({Key key, @required this.incrementCounterFunction})
      : super(key: key);

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ABloc, AState>(
      builder: (context, state) {
        print("New state from A");
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Page A"),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: FloatingActionButton.extended(
              onPressed: () => widget.incrementCounterFunction(state.count + 1),
              tooltip: 'Increment',
              backgroundColor: Colors.redAccent,
              label: Text('Increment Counter for all Pages'),
            ),
          ),
          body: Center(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter in Page A is :",
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
