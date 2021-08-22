import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';
import 'package:rx_notifier/rx_notifier.dart';

class RecipeDetailController {
  final _rxRecipeDTO = RxNotifier<RecipeDTO?>(null);
  RecipeDTO? get rxRecipeDTO => _rxRecipeDTO.value;

  RecipeDetailController();

  refresh(RecipeDTO recipeDTO) async {
    _rxRecipeDTO.value = recipeDTO;
  }
}
