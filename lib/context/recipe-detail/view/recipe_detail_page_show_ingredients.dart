import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';
import 'package:recipe_test/context/recipe-detail/view/utils/basic_detail_list_component.dart';
import 'package:recipe_test/context/recipe-list/models/ingredient.dart';
import 'package:recipe_test/core/utils/string_extension.dart';

extension RecipeDetailPageStateShowIngredients on RecipeDetailPageState {
  showIngredients(List<Ingredient>? ingredients) {
    var list = <String>[];
    ingredients?.forEach((element) {
      list.add(
          '${element.quantity?.capitalizeFirstofEach}  ${element.name?.capitalizeFirstofEach}');
    });

    return showBasicList('Ingredients', list, context);
  }
}
