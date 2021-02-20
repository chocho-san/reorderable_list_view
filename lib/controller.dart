import 'package:flutter/cupertino.dart';

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

class Model {
  final String title;
  final String key;

  Model({
    @required this.title,
    @required this.key,
  });
}
