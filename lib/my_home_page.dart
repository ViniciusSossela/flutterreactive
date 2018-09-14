import 'package:blocsample/my_home_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = MyHomeBloc();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'O resultado final é:',
            ),
            StreamBuilder<int>(
              stream: bloc.counterStream,
              builder: (context, snap) => Text(
                    snap?.data.toString() ?? "0",
                    style: Theme.of(context).textTheme.display1,
                  ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => bloc.incrementCounter(5),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => bloc.decrementCounter(1),
            tooltip: 'Decrement',
            child: Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
