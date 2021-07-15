import 'package:flutter/cupertino.dart';

class OnlineFoodServiceViewModel extends ChangeNotifier {
  final listOfBurgerCategories = [
    "FEATURED",
    "JUMBO",
    "WHOOPER",
    "CATEGORY A",
    "CATEGORY B",
    "CATEGORY C"
  ];

  int selectedCategory = 0;

  changeSelectedCategory(int index) {
    selectedCategory = index;
    notifyListeners();
  }


}
