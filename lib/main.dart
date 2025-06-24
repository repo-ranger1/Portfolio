import 'package:flutter/material.dart';
import 'app.dart';
import 'core/utils/storage/local_storage/local_storage.dart';
import 'dependency_injector.dart';

/// [NavigatorKey] for navigation from anywhere,
/// will be used only when token expires in between
/// the session and need to navigate to the [LoginScreen]
/// from the any [Repositories].
final GlobalKey<NavigatorState> globalNavKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Local storage utilizing share pref.
  await LocalStorage().init();

  // Inject the dependencies.
  DependencyInjector.inject();

  runApp(const MyApp());
}
