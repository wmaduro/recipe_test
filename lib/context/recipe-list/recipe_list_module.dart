import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/context/recipe-list/controller/recipe_list_controller.dart';
import 'package:recipe_test/context/recipe-list/view/recipe_list_page.dart';
import 'package:recipe_test/core/constants/route_constants.dart';

class RecipeListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => RecipeListController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RouteConstants.recipeListNav,
        child: (_, args) => RecipeListPage()),
  ];
}
