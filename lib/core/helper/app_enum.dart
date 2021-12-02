import 'package:flutter/rendering.dart' show Size;

enum Flavor { DEV, PROD }

enum HttpAction { GET, POST, PUT, PATCH, POST_ENCODED_URL, DELETE }

enum DeviceType { MOBILE, TABLET }

enum LoadingState { LOADING, LOADED, FAILED }

extension DeviceTypeExtention on DeviceType {
  Size get size {
    switch (this) {
      case DeviceType.MOBILE:
        return const Size(375, 812);
      case DeviceType.TABLET:
        return const Size(768, 1024);
    }
  }
}

String enumToString<T>(dynamic enumValue) => enumValue.toString().split('.').last;