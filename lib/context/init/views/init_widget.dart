import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/core/utils/color_util.dart';

class InitWidget extends StatefulWidget {
  @override
  _InitWidgetState createState() => _InitWidgetState();
}

class _InitWidgetState extends State<InitWidget> {
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
        fontFamily: 'Arial',
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.grey[700],
          ),
        ),
      ),
    ).modular();
  }
}
