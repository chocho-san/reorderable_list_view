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

  void newList(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final TileData model = items.removeAt(oldIndex);
    items.insert(newIndex, model);
    notifyListeners();
  }




  int _indexOfKey(Key key) {
    return items.indexWhere((TileData d) => d.key == key);
  }

  bool reorderCallback(Key item, Key newPosition) {
    int draggingIndex = _indexOfKey(item);
    int newPositionIndex = _indexOfKey(newPosition);

    // Uncomment to allow only even target reorder possition
    // if (newPositionIndex % 2 == 1)
    //   return false;

    final draggedTile = items[draggingIndex];

    items.removeAt(draggingIndex);
    items.insert(newPositionIndex, draggedTile);
    notifyListeners();
    return true;
  }


}
