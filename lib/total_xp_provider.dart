import 'package:flutter/material.dart';

class TotalXpProvider with ChangeNotifier {
  int _score = 0;

  int get score => _score;

  void incrementScore(int increment) {
    _score += increment;
    notifyListeners();
  }

  void resetScore() {
    _score = 0;
    notifyListeners();
  }
}
