import 'package:clean_architecture_tdd/core/helper/app_enum.dart';

class FlavorValues {

  // Add other flavor values here. eg: database name, themes, etc.
  final String appName;
  final String baseUrl;

  FlavorValues({required this.appName, required this.baseUrl});
}

class FlavorConfig {

  final Flavor flavor;
  final String name;
  final FlavorValues values;

  static FlavorConfig? _instance;

  factory FlavorConfig({required Flavor flavor, required FlavorValues values}) {
    
    _instance ??= FlavorConfig._internal(flavor, enumToString<Flavor>(flavor), values);

    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static FlavorConfig? get instance => _instance;

  static bool get isProduction => instance?.flavor == Flavor.PROD;
}