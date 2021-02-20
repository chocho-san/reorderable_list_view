import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_list/controller.dart';

class SimpleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(builder: (_, controller, __) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Long Press & Drag'),
        ),
        body: Container(
          child: ReorderableListView(
            onReorder: (a, b) {
              controller.newList(a, b);
            },
            children: controller.modelList.map((model) {
              return Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(14, 98, 128, 10),
                  border: Border.all(color: Theme.of(context).primaryColor),
                ),
                key: Key(model.key),
                child: Center(
                    child: Text(
                  model.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}
