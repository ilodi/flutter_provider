import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  //eventos para el estado
  void increment() {
    _counter++;
    //les dice que el estado cambio
    notifyListeners();
  }

  void decrement() {
    _counter--;
    //les dice que el estado cambio
    notifyListeners();
  }

  void reset(){
    _counter=0;
    notifyListeners();
  }

}
