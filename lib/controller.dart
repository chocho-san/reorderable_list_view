import 'package:flutter/cupertino.dart';
import 'package:reorderable_list/model.dart';

class Controller with ChangeNotifier {
  List<Model> modelList = List.generate(
    20,
    (i) => Model(
      title: "List ${i+1}",
      key: i.toString(),
    ),
  );


  void newList(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Model model = modelList.removeAt(oldIndex);
    modelList.insert(newIndex, model);
    notifyListeners();
  }
}
