import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:recipe_test/context/splash/controllers/splash_controller.dart';
import 'package:recipe_test/core/config/app_context.dart';
import 'package:recipe_test/core/utils/color_util.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  var _splashController = Modular.get<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsUtil.lightBackground,
        child: Padding(
          padding: const EdgeInsets.only(right: 50, left: 50),
          child: RxBuilder(builder: (_) {
            return AnimatedOpacity(
              onEnd: () async {
                _splashController.refreshImageOpacity();
              },
              opacity: _splashController.rxOpacityLevel.value,
              duration: Duration(microseconds: 500),
              curve: Curves.fastOutSlowIn,
              child: Center(
                child: Image.asset(
                  'assets/images/foodstuffs_logo.jpeg',
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _splashController.refreshImageOpacity();
    });

    // Future.delayed(Duration(seconds: 2), () {
    //   _splashController.refreshState();
    // });

    super.initState();
    appContext.currentContextx = context;
  }
}
