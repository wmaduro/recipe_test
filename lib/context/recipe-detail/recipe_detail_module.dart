import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/context/recipe-detail/controller/recipe_detail_controller.dart';
import 'package:recipe_test/context/recipe-detail/view/recipe_detail_page.dart';
import 'package:recipe_test/core/constants/route_constants.dart';

class RecipeDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => RecipeDetailController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RouteConstants.recipeDetailNav,
        child: (_, args) => RecipeDetailPage(
          recipeDTO: args.data,
        )),
  ];
}
