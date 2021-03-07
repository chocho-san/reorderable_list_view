import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_list/model.dart';


final controllerProvider = ChangeNotifierProvider((ref) => Controller());

class Controller with ChangeNotifier {
  List<Model> modelList = List.generate(
    20,
    (i) => Model(
      title: "List ${i+1}",
      key:ValueKey(i),
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
