import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/context/global/global_module.dart';
import 'package:recipe_test/context/global/views/global_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: GlobalModule(),
      child: GlobalWidget(),
    ),
  );
}
