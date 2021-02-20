import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reorderable_list/controller.dart';
import 'package:reorderable_list/list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List',
      theme:  ThemeData(
          primaryColor: Color.fromRGBO(12,84,110, 1),
      ),
      home: ChangeNotifierProvider<Controller>(
        create: (_) => Controller(),
        child: SimpleScreen(),
      ),
    );
  }
}