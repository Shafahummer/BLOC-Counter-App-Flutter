import 'package:flutter/material.dart';
import 'CounterBloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  void dispose() {
    super.dispose();
    _counterBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                stream: _counterBloc.counterStream,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text("${snapshot.data}");
                }),
            RaisedButton(
                onPressed: () {
                  _counterBloc.eventSink.add(CounterAction.Increment);
                },
                child: Text("INC")),
            RaisedButton(
                onPressed: () {
                  _counterBloc.eventSink.add(CounterAction.Decrement);
                },
                child: Text("DEC")),
            RaisedButton(
                onPressed: () {
                  _counterBloc.eventSink.add(CounterAction.Reset);
                },
                child: Text("RESET")),
          ],
        )),
      ),
    );
  }
}
