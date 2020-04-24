import 'package:flutter/material.dart';
import 'package:providers/pages/deatil_page.dart';
import 'package:providers/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:providers/pages/user_form.dart';
import 'package:providers/providers/counter_provider.dart';
import 'package:providers/providers/user_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CounterProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserFormPage(),
        routes: {
          DetailPage.routeName: (_) => DetailPage(),
        },
      ),
    );
  }
}
