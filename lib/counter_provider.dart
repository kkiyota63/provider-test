import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); //状態が変更されたことをリスナーに通知する
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}
