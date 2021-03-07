import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_list/controller.dart';

class SimpleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch,child) {
        final controller = watch(controllerProvider);
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Color.fromARGB(255, 62, 43, 255),
                  Color.fromARGB(255, 49, 101, 255),
                  Color.fromARGB(255, 69, 207, 255),
                ],
              )),
            ),
            Scaffold(
              backgroundColor:  Colors.transparent,
              appBar: AppBar(
                backgroundColor:  Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                title: Text('Long Press & Drag'),
              ),
              body: Theme(
                data: ThemeData(
                  canvasColor: Colors.transparent,
                ),
                child: ReorderableListView(
                  onReorder: (a, b) {
                    controller.newList(a, b);
                  },
                  children: controller.modelList.map((model) {
                    return Container(
                      margin:  EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      padding:  EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      key:model.key,
                      child: Center(
                        child: Text(
                          model.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
