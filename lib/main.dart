import 'package:ecommerce/feature/main/main_module.dart';
import 'package:ecommerce/feature/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  runApp(
    ModularApp(
      module: MainModule(),
      child: const MainPage(),
    ),
  );
}
