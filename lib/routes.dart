import 'package:flutter/material.dart';
import './main.dart';

Map<String, WidgetBuilder> appRoutes(BuildContext context) {
  return {
    'root': (context) => const MyHomePage(title: 'title'),
    // Ajoutez d'autres routes au besoin
  };
}