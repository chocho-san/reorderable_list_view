import 'package:flutter/material.dart';
import 'package:reorderable_list/handle/handle_list.dart';
import 'package:reorderable_list/long_press/longpress_list.dart';

class HomeScreen extends StatelessWidget {
  final List<String> _tabs = ['longpress&drag', 'handleList'];

  @override
  Widget build(BuildContext context) {
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
        DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 62, 43, 255),
              title: Text(
                  'Reorderable'),
            ),
            // child: NestedScrollView(
            //   headerSliverBuilder:
            //       (BuildContext context, bool innerBoxIsScrolled) {
            //     return <Widget>[
            //       SliverOverlapAbsorber(
            //         handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
            //             context),
            //         sliver: SliverAppBar(
            //           pinned: true,
            //
            //           centerTitle: true,
            //           expandedHeight: 50.0,
            //           forceElevated: innerBoxIsScrolled,
            //
            //           bottom: TabBar(
            //
            //             isScrollable: true,
            //             labelStyle: TextStyle(
            //                 fontSize: 40, fontWeight: FontWeight.bold),
            //             unselectedLabelStyle: TextStyle(fontSize: 17),
            //             tabs: _tabs
            //                 .map((String name) => Tab(text: name))
            //                 .toList(),
            //           ),
            //         ),
            //       ),
            //     ];
            //   },
            bottomNavigationBar: Container(
              height: 70,
              child: TabBar(

                labelColor: Colors.white,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.white,
                labelStyle: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontSize: 17),
                tabs: _tabs.map((String name) => Tab(text: name)).toList(),
              ),
            ),
            body: Theme(
              data: ThemeData(
                canvasColor: Colors.transparent,
              ),
              child: TabBarView(
                children: [
                  LongPressScreen(),
                  HandleList(),
                ],
              ),
              // children: _tabs.map((String name) {
              //   return SafeArea(
              //     top: false,
              //     bottom: false,
              //     child: Builder(
              //       builder: (BuildContext context) {
              //         return CustomScrollView(
              //           key: PageStorageKey<String>(name),
              //           slivers: <Widget>[
              //             SliverOverlapInjector(
              //               handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              //             ),
              //             SliverPadding(
              //               padding: const EdgeInsets.all(8.0),
              //               sliver: SliverFixedExtentList(
              //                 itemExtent: 48.0,
              //                 delegate: SliverChildBuilderDelegate(
              //                       (BuildContext context, int index) {
              //                     return ListTile(
              //                       title: Text('Item $index'),
              //                     );
              //                   },
              //                   childCount: 30,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         );
              //       },
              //     ),
              //   );
              // }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
