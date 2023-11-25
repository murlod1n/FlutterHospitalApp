import "package:flutter/material.dart";
import "app/routing/app_router.dart";
import "app/service_locator/locator_config.dart";

Future<void> main() async {
  await initializeLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: locator<AppRouter>().config()
    );
  }

}
