import 'app_config.dart';

mixin Environment {
  static final dev = AppConfig(
    appName: '[DEV] Afya Conecta',
    appEnvironment: AppEnvironment.development,
    apiBaseUrl: 'https://api.postmon.com.br/v1/',
  );

  static final prod = AppConfig(
    appName: '[DEV] Afya Conecta',
    appEnvironment: AppEnvironment.production,
    apiBaseUrl: 'https://conecta.com/api/',
  );
}
