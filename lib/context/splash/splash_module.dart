import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/context/splash/views/splash_page.dart';
import 'package:recipe_test/core/constants/route_constants.dart';

import 'controllers/splash_controller.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(RouteConstants.rootNav, child: (_, args) => SplashPage()),
  ];
}
