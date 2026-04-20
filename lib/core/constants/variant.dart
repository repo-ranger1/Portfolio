/// Portfolio variant system.
///
/// Each Vercel project sets a different VARIANT environment variable,
/// which is injected at build time via --dart-define=VARIANT=flutter (etc).
///
/// Vercel build command per project:
///   flutter build web --release --dart-define=VARIANT=flutter
///   flutter build web --release --dart-define=VARIANT=ios_native
///   flutter build web --release --dart-define=VARIANT=android_native
///   flutter build web --release --dart-define=VARIANT=flutter_ios
///   flutter build web --release --dart-define=VARIANT=flutter_android
///   flutter build web --release --dart-define=VARIANT=native
class Variant {
  Variant._();

  static const String current =
      String.fromEnvironment('VARIANT', defaultValue: 'flutter');

  // gautammanwani01.vercel.app
  static bool get isFlutter => current == 'flutter';

  // gautammanwani02.vercel.app
  static bool get isIOSNative => current == 'ios_native';

  // gautammanwani03.vercel.app
  static bool get isAndroidNative => current == 'android_native';

  // gautammanwani04.vercel.app
  static bool get isFlutterIOS => current == 'flutter_ios';

  // gautammanwani05.vercel.app
  static bool get isFlutterAndroid => current == 'flutter_android';

  // gautammanwani06.vercel.app — Android + iOS native combined
  static bool get isNative => current == 'native';

  /// Whether the Play Store button should be shown.
  /// Hidden on pure iOS variants.
  static bool get showPlayStore =>
      isFlutter || isAndroidNative || isFlutterAndroid || isNative;

  /// Whether the App Store button should be shown.
  /// Hidden on pure Android variants.
  static bool get showAppStore =>
      isFlutter || isIOSNative || isFlutterIOS || isNative;
}
