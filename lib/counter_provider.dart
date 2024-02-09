import 'package:flutter/foundation.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  List<HistoryEntry> _history = [];

  int get count => _count;
  List<HistoryEntry> get history => List.unmodifiable(_history);

  void increment() {
    _count++;
    notifyListeners(); //状態が変更されたことをリスナーに通知する
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class HistoryEntry {
  final int count;
  final DateTime timestamp;

  HistoryEntry(this.count, this.timestamp);
}
