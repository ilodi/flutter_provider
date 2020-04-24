import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providers/counter_provider.dart';

class ChildCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context, listen: false);
    print('child');
    return Container(
      padding: EdgeInsets.all(21),
      child: Row(
        children: <Widget>[
          Consumer<CounterProvider>(
            builder: (_, provider, widget) {
              return Text("Child: ${provider.counter}");
            },
          ),
          FlatButton(
            child: Text('Reset'),
              onPressed: (){
                counterProvider.reset();
              },
          )
        ],
      ),
    );
  }
}
