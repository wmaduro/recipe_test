import 'package:rx_notifier/rx_notifier.dart';

class SplashController {
  final rxOpacityLevel = RxNotifier<double>(1.0);

  refreshImageOpacity() {
    rxOpacityLevel.value = rxOpacityLevel.value == 1 ? 0.3 : 1.0;
  }
}
