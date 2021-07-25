import 'package:flutter/cupertino.dart';
import 'package:food_application/models/Images.dart';
import 'package:food_application/services/api/ApiCalls.dart';
import 'package:food_application/services/api/Debugger.dart';
import 'package:food_application/services/chache/HiveService.dart';

class WallpaperScreenViewModel extends ChangeNotifier {
  List<Photos> listOfImages = [];
  bool isLoading = true;

  getWallpapers(int pageNumber) {
    ApiCalls.fetchAllImages(pageNumber).then((value) {
      listOfImages.clear();
      isLoading = false;
      listOfImages.addAll(value.photos);
      Debugger.printLog("${value.photos.length.toString()} total images");
      notifyListeners();
    });
  }

  refreshList(String boxName) async {
    listOfImages.clear();
    await HiveService().deleteAllBox(boxName);
    notifyListeners();
    ApiCalls.fetchAllImages(1).then((value) {
      isLoading = false;
      listOfImages.addAll(value.photos);
      Debugger.printLog("${value.photos.length.toString()} total images");
      notifyListeners();
    });
  }
}
