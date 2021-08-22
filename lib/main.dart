import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/context/init/init_module.dart';
import 'package:recipe_test/context/init/views/init_widget.dart';

void main() {
  runApp(
    ModularApp(module: InitModule(), child: InitWidget()),
  );
}
