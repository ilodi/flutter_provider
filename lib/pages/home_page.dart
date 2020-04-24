import 'package:flutter/material.dart';
import 'package:providers/providers/counter_provider.dart';
import 'package:provider/provider.dart';
import 'package:providers/widgets/child_counter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterProvider _counterProvider = CounterProvider();

  @override
  void initState() {
    super.initState();

    _counterProvider.addListener(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    print('Home');
    return ChangeNotifierProvider.value(
      value: _counterProvider,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<CounterProvider>(
                builder: (_, provider, widget) {
                  return Text(provider.counter.toString());
                },
              ),
              ChildCounter(),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _counterProvider.decrement();
              },
            ),
            SizedBox(
              width: 21,
            ),
            FloatingActionButton(
              onPressed: () {
                _counterProvider.increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
