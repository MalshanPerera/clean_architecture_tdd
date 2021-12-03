abstract class GeneralException {
  String? message;
  String? errorText;
  Duration? duration;
  void Function()? onTap;
}

class SkeletonHttpException implements GeneralException {

  SkeletonHttpException({
    this.message,
    this.duration = const Duration(seconds: 3),
    this.errorText,
    this.onTap,
  });

  @override
  Duration? duration;

  @override
  String? message;

  @override
  void Function()? onTap;

  @override
  String? errorText;

  @override
  String toString() => errorText ?? message!;
}

class SkeletonTimeOutException implements GeneralException {

  SkeletonTimeOutException({
    this.message,
    this.duration = const Duration(seconds: 3),
    this.errorText,
    this.onTap,
  });

  @override
  Duration? duration;

  @override
  String? message;

  @override
  void Function()? onTap;

  @override
  String? errorText;

  @override
  String toString() => errorText ?? message!;
}

class SkeletonNetworkException implements GeneralException {

  SkeletonNetworkException({
    this.message,
    this.duration = const Duration(seconds: 3),
    this.errorText,
    this.onTap,
  });

  @override
  Duration? duration;

  @override
  String? message;

  @override
  void Function()? onTap;

  @override
  String? errorText;

  @override
  String toString() => errorText ?? message!;
}