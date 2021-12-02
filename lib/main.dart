import 'package:clean_architecture_tdd/injection_container.dart' as di;
import 'package:flutter/material.dart';

import 'core/helper/app_enum.dart';
import 'flavor_config.dart';
import 'head.dart';

void main() async {
  FlavorConfig(
    flavor: Flavor.DEV,
    values: FlavorValues(
      baseUrl: 'http://ec2-52-28-136-161.eu-central-1.compute.amazonaws.com:3000',
    ),
  );

  di.init();
  runApp(const Head());
}