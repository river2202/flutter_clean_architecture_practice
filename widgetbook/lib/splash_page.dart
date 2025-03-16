import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_practice/app/splash_page.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SplashPage)
Widget buildSplashPageUseCase(BuildContext context) {
  return const SplashPage(title: 'Flutter Clean Architecture Practice');
}
