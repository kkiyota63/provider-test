import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);
    var history = counterProvider.history;

    return Scaffold(
      appBar: AppBar(title: Text('Counter with History')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Count: ${history[index].count}'),
            subtitle: Text('Time: ${history[index].timestamp}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterProvider.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Text(
          '${counterProvider.count}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterProvider.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      //リセットボタンを追加
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () => counterProvider.reset(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
