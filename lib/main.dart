import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop_navigations/providers/image_providers.dart';
import 'package:workshop_navigations/router/config_router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ImageProviderModel()),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
