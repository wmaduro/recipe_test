import 'dart:convert';

import 'package:flutter/services.dart';

class RecipeDataService {
  Future getAllRecipes() async {
    var jsonText = await rootBundle.loadString('assets/files/data.json');
    var teste = json.decode(jsonText);
    return teste;
  }
}
