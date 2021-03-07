import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_list/list_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'List',
      theme:  ThemeData(
        brightness: Brightness.dark,
        primaryColorBrightness: Brightness.dark,
      ),
      home: SimpleScreen(),

    );
  }
}
