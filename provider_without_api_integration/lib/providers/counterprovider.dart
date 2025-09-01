import 'package:flutter/material.dart';
import 'package:flutter_provider_boilerplate/models/countermodel.dart';

class CounterProvider with ChangeNotifier {
  CounterModel _counter = CounterModel(0);

  CounterModel get counter => _counter;

  void increment() {
    _counter = CounterModel(_counter.count + 1);
    notifyListeners();
  }

  void decrement() {
    _counter = CounterModel(_counter.count - 1);
    notifyListeners();
  }
}
