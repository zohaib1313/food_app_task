import 'package:hive/hive.dart';

class HiveService {
  isExists({required String boxName}) async {
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;
    return length != 0;
  }

  addBoxes<T>(T items, String boxName) async {
    print("adding boxes");
    final openBox = await Hive.openBox(boxName);

    openBox.add(items);
  }

  deleteAllBox(String boxName) async {
    var exists = await isExists(boxName: boxName);
    if (exists) {
      final openBox = await Hive.openBox(boxName);
      return await openBox.deleteFromDisk();
    }
  }

  Future<List<T>> getBoxes<T>(String boxName) async {
    List<T> boxList = [];
    final openBox = await Hive.openBox(boxName);
    int length = openBox.length;

    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }

    return boxList;
  }
}
