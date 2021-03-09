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
    return Theme(
      data: ThemeData(
        canvasColor: Colors.transparent,
      ),
      child: ReorderableItem(
        key: data.key, //
        childBuilder: (BuildContext context, ReorderableItemState state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            height: 70,
            decoration:
                //ドラッグしているときの移動してるタイルの色
                //終わる直前の手放した後の色
                (state == ReorderableItemState.dragProxy ||
                        state == ReorderableItemState.dragProxyFinished)
                    ? BoxDecoration(color: Colors.transparent)
                    //元のリストの形の時のカラー
                    :
                    // リストタイルがつかまれてる
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
                        /* color:
                            */ /*state == ReorderableItemState.placeholder
                    ? Colors.transparent
                    : */ /*
                            Colors.transparent*/
                      ),
            child: SafeArea(
              top: false,
              bottom: false,
              child: Opacity(
                //ドラッグ移動してるタイルを隠す
                opacity: state == ReorderableItemState.placeholder ? 0.0 : 1.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        data.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ReorderableListener(
                      child: Container(
                        padding: EdgeInsets.only(right: 18.0, left: 18.0),
                        child: Center(
                          child: Icon(Icons.reorder, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
