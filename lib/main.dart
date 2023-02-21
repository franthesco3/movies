import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies/support/adapters/movie_adapter.dart';
import 'package:movies/support/utils/hive_configs.dart';

import 'support/utils/mobile_routes.dart';

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
    );
  }
}
