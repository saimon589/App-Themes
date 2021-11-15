

import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier{
  int count = 0;
  increase(){
    count++;
    notifyListeners();
  }
  decrease(){
    count--;
    notifyListeners();
  }
}