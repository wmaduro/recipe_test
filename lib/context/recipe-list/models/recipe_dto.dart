import 'ingredient.dart';

class RecipeDTO {
  String? name;
  List<Ingredient>? ingredients;
  List<dynamic>? steps;
  List<dynamic>? timers;
  String? imageUrl;
  String? originalUrl;

  RecipeDTO({
    this.name,
    this.ingredients,
    this.steps,
    this.timers,
    this.imageUrl,
    this.originalUrl,
  });

  factory RecipeDTO.fromJson(Map<String, dynamic> json) => RecipeDTO(
        name: json['name'] as String?,
        ingredients: (json['ingredients'] as List<dynamic>?)
            ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
            .toList(),
        steps: json['steps'] as List<dynamic>?,
        timers: json['timers'] as List<dynamic>?,
        imageUrl: json['imageURL'] as String?,
        originalUrl: json['originalURL'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'ingredients': ingredients?.map((e) => e.toJson()).toList(),
        'steps': steps,
        'timers': timers,
        'imageURL': imageUrl,
        'originalURL': originalUrl,
      };
}
