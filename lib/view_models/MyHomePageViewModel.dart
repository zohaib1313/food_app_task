import 'package:flutter/cupertino.dart';

class MyHomePageViewModel extends ChangeNotifier {
  String priceSmall = "\$350";
  String priceMedium = "\$650";
  String priceLarge = "\$950";

  double smallBurgerWidth = 100;
  double mediumBurgerWidth = 150;
  double largeBurgerWidth = 200;

  String smallTitle = "ANGRY \nWHOOPER";
  String mediumTitle = "FURIOUS \nWHOOPER";
  String largeTitle = "ULTRA \nWHOOPER";

  String selectedPrice = "\$650";
  double selectedBurgerWidth = 150;
  String selectedBurgerTitle = "FURIOUS \nWHOOPER";
  String selectedButton = "medium";

  void selectSmallBurger() {
    selectedPrice = priceSmall;
    selectedBurgerWidth = smallBurgerWidth;
    selectedBurgerTitle = smallTitle;
    selectedButton = "small";
    notifyListeners();
  }

  void selectMediumBurger() {
    selectedPrice = priceMedium;
    selectedBurgerWidth = mediumBurgerWidth;
    selectedBurgerTitle = mediumTitle;
    selectedButton = "medium";
    notifyListeners();
  }

  void selectLargeBurger() {
    selectedPrice = priceLarge;
    selectedBurgerWidth = largeBurgerWidth;
    selectedBurgerTitle = largeTitle;
    selectedButton = "large";
    notifyListeners();
  }
}
