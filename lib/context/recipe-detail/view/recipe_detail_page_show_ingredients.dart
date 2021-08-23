import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';
import 'package:recipe_test/context/recipe-list/models/ingredient.dart';

extension RecipeDetailPageStateShowIngredients on RecipeDetailPageState {
  showIngredients(List<Ingredient>? ingredients) {
    var widgetList = <Widget>[];
    ingredients?.forEach((element) {
      widgetList.add(Text('${element.quantity} ${element.name}'));
    });

    return Column(children: widgetList);
  }
}
