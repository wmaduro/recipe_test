import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/context/recipe-list/recipe_list_module.dart';
import 'package:recipe_test/context/recipe-list/service/recipe_data_service.dart';
import 'package:recipe_test/context/splash/splash_module.dart';
import 'package:recipe_test/core/constants/route_constants.dart';

class InitModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => RecipeDataService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(RouteConstants.rootNav, module: SplashModule()),
    ModuleRoute(RouteConstants.recipeListNav, module: RecipeListModule()),
  ];
}
