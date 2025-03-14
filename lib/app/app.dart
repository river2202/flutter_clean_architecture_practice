import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_practice/app/splash_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashPage(title: 'Flutter Clean Architecture Practice'),
    );
  }
}
