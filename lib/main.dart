import 'package:hive/hive.dart';
import 'support/utils/localize.dart';
import 'package:flutter/material.dart';
import 'support/utils/mobile_routes.dart';
import 'package:movies/support/utils/hive_configs.dart';
import 'package:flutter_gen/gen_l10n/localization.dart';
import 'package:movies/support/adapters/movie_adapter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfigs.start();
  Hive.registerAdapter(MovieHiveAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: MobileRoutes.routes,
      initialRoute: MobileRoutes.initialRoutes,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      onGenerateTitle: (context) => Localize.instance.of(context).appTitle,
    );
  }
}
