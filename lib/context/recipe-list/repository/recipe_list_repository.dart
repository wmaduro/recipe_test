import 'package:recipe_test/context/recipe-list/models/recipe_dto_list.dart';
import 'package:recipe_test/context/recipe-list/service/recipe_data_service.dart';

class RecipeListRepository {
  final RecipeDataService recipeDataService;

  RecipeListRepository(this.recipeDataService);

  Future<RecipeDTOList> getAllRecipies() async {
    return await recipeDataService.getAllRecipes().then((json) {
      return RecipeDTOList.fromJson(json);
    });
  }
}
