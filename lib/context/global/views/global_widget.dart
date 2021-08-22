import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/core/utils/color_util.dart';

class GlobalWidget extends StatefulWidget {
  @override
  _GlobalWidgetState createState() => _GlobalWidgetState();
}

class _GlobalWidgetState extends State<GlobalWidget> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'FoodStuffs Recipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ColorsUtil.lightBackground,
      ),
    ).modular();
  }
}
