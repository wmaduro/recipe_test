import 'package:recipe_test/context/recipe-list/models/recipe_dto.dart';

class RecipeDTOList {
  final List<RecipeDTO> recipes;

  RecipeDTOList({
    required this.recipes,
  });

  factory RecipeDTOList.fromJson(List<dynamic> parsedJson) {
    List<RecipeDTO> recipes =
        parsedJson.map((i) => RecipeDTO.fromJson(i)).toList();

    return new RecipeDTOList(
      recipes: recipes,
    );
  }
}
