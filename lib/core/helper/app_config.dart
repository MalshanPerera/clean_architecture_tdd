import 'package:clean_architecture_tdd/flavor_config.dart';

class AppConfig {

  static final String _baseUrl = FlavorConfig.instance!.values.baseUrl;

  static String get authentication => "$_baseUrl/auth";
}