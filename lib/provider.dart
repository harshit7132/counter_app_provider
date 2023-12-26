import 'package:flutter/material.dart';

class counter_provider extends ChangeNotifier {
  int counter = 0;
  increment() {
    counter++;
    notifyListeners();
  }

  decrement() {
    if (counter == 0) {
      return counter;
    } else {
      counter--;
      notifyListeners();
    }
  }

  int getValue() => counter;
}
