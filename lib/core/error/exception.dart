class GeneralException {

  GeneralException({
    this.message,
    this.duration = const Duration(seconds: 3),
    this.errorText,
    this.onTap,
  });

  Duration? duration;

  String? message;

  void Function()? onTap;

  String? errorText;

  @override
  String toString() => errorText ?? message!;

}