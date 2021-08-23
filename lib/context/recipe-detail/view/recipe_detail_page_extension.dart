import 'package:flutter/material.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';
import 'package:recipe_test/context/recipe-list/models/ingredient.dart';

extension RecipeDetailPageStateExtension on RecipeDetailPageState {
  showHeader(String? imageUrl, String? name, int? totalTime) {
    return Column(children: [
      Text(
        name ?? '',
        style: TextStyle(fontSize: 25),
      ),
      Text(
        imageUrl ?? '',
        style: TextStyle(fontSize: 25),
      ),
      Text(
        '${totalTime ?? 0}',
        style: TextStyle(fontSize: 25),
      ),
    ]);
  }

  showIngredients(List<Ingredient>? ingredients) {
    var widgetList = <Widget>[];
    ingredients?.forEach((element) {
      widgetList.add(Text('${element.quantity} ${element.name}'));
    });

    return Column(children: widgetList);
  }

  showSteps(List? steps) {
    var widgetList = <Widget>[];
    steps?.forEach((element) {
      widgetList.add(Text('${element}'));
    });

    return Column(children: widgetList);
  }
}
