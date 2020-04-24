import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providers/counter_provider.dart';
import 'package:providers/providers/user_provider.dart';

class DetailPage extends StatelessWidget {
  static final routeName = "detail";

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    final CounterProvider counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Consumer<UserProvider>(builder: (_, provider, widget) {
              return Text(provider.name ?? null);
            }),
          ],
        ),
      ),
    );
  }
}
