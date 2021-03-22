import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_B/b_bloc.dart';
import 'package:replication_data_problem_solution/src/bloc_handler/increment_handler.dart';

class PageB extends StatefulWidget {
  final void Function(int incrementNumber) incrementCounterFunction;

  const PageB({Key key, @required this.incrementCounterFunction})
      : super(key: key);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BBloc, BState>(
      builder: (context, state) {
        print("New state from B");

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[800],
            title: Text("Page B"),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: FloatingActionButton.extended(
              onPressed: () => widget.incrementCounterFunction(state.count + 1),
              tooltip: 'Increment',
              backgroundColor: Colors.blueGrey[800],
              label: Text('Increment Counter for all Pages'),
            ),
          ),
          body: Center(
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter in Page B is :",
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
