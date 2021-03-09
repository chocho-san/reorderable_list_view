import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_list/tile_data.dart';


final controllerProvider = ChangeNotifierProvider((ref) => Controller());

class Controller with ChangeNotifier {
  List<TileData> items = List.generate(
    20,
        (i) => TileData(
      title: "List ${i+1}",
      key:ValueKey(i),
    ),
  );


  //ReorderableListView用
  void newList(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final TileData model = items.removeAt(oldIndex);
    items.insert(newIndex, model);
    notifyListeners();
  }



  //flutter_reorderable_list package 用
  int _indexOfKey(Key key) {
    return items.indexWhere((TileData d) => d.key == key);
  }

  bool reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);


    final draggedTile = items[draggingIndex];

    items.removeAt(draggingIndex);
    items.insert(newPositionIndex, draggedTile);
    notifyListeners();
    return true;
  }


}
