import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_list/controller.dart';
import 'package:reorderable_list/handle/item_tile.dart';

class HandleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final controller = watch(controllerProvider);
      return ReorderableList(
        onReorder: controller.reorderCallback,
        child: CustomScrollView(
          //スライバー
          slivers: <Widget>[

            SliverPadding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return ItemTile(
                      data: controller.items[index],
                      // first and last attributes affect border drawn during dragging
                      isFirst: index == 0,
                      isLast: index == controller.items.length - 1,
                    );
                  },
                  childCount: controller.items.length,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}