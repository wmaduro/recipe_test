import 'package:recipe_test/context/recipe-detail/recipe_detail_module.dart';
import 'package:recipe_test/context/recipe-list/recipe_list_module.dart';
import 'package:recipe_test/context/splash/splash_module.dart';

import 'route_constants.dart';

enum ModuleInfoEnum {
  SPLASH,
  RECIPE_LIST,
  RECIPE_DETAIL,
}

extension ModuleInfoEnumExtension on ModuleInfoEnum {
  ModuleInfo get moduleInfo {
    switch (this) {
      case ModuleInfoEnum.SPLASH:
        return ModuleInfo(RouteConstants.rootNav, () => SplashModule());

      case ModuleInfoEnum.RECIPE_LIST:
        return ModuleInfo(
            RouteConstants.recipeListNav, () => RecipeListModule());

      case ModuleInfoEnum.RECIPE_DETAIL:
        return ModuleInfo(
            RouteConstants.recipeDetailNav, () => RecipeDetailModule());
    }
  }
}

class ModuleInfo {
  final String path;
  final Function() moduleFunction;

  ModuleInfo(this.path, this.moduleFunction);
}
