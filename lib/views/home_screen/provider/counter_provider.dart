import 'package:flutter/cupertino.dart';

import '../model/counter_model.dart';

class CounterProvider extends ChangeNotifier {
  Counter counter = Counter(count: 0);

  void increment() {
    counter.count++;
    notifyListeners();
  }
}
