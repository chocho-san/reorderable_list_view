import 'package:flutter/material.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:reorderable_list/tile_data.dart';

class ItemTile extends StatelessWidget {
  ItemTile({
    this.data,
    this.isFirst,
    this.isLast,
  });

  final TileData data;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return ReorderableItem(
      key: data.key, //
      childBuilder: (BuildContext context, ReorderableItemState state) {
        return Container(
          decoration:
              //ドラッグしているときの移動してるタイルの色
              //終わる直前の手放した後の色
              (state == ReorderableItemState.dragProxy ||
                      state == ReorderableItemState.dragProxyFinished)
                  ?
                  // slightly transparent background white dragging (just like on iOS)
                  BoxDecoration(color: Colors.grey.withOpacity(0.7))
                  //元のリストの形の時のカラー
                  :
                  // リストタイルがつかまれてるかどうか
                  BoxDecoration(
                      border: Border(
                          top: isFirst &&
                                  state != ReorderableItemState.placeholder
                              ? Divider.createBorderSide(context) //
                              : BorderSide.none,
                          bottom: isLast &&
                                  state == ReorderableItemState.placeholder
                              ? BorderSide.none //
                              : Divider.createBorderSide(context)),
                      //つかまれてるなら元々そこにあったタイルの色
                      //他のすべてのつかまれてないタイルの色
                      color:
                          /*state == ReorderableItemState.placeholder
                  ? Colors.transparent
                  : */
                          Colors.transparent),
          child: SafeArea(
            top: false,
            bottom: false,
            child: Opacity(
              // hide content for placeholder
              opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 14.0),
                        child: Text(
                          data.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ReorderableListener(
                      child: Container(
                        padding: EdgeInsets.only(right: 18.0, left: 18.0),
                        color: Colors.grey.withOpacity(0.3),
                        child: Center(
                          child: Icon(Icons.reorder, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
