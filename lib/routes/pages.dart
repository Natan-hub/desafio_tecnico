import 'package:desafio_tecnico/models/carro_model.dart';
import 'package:desafio_tecnico/routes/routes.dart';
import 'package:desafio_tecnico/screens/carro_detalhes_screen.dart';
import 'package:desafio_tecnico/screens/carro_list_screen.dart';
import 'package:flutter/material.dart';

class Pages {
  static Route generateRoute(RouteSettings settings) {
    final routeName = settings.name;

    switch (routeName) {
      case Routes.baseScreen:
        return MaterialPageRoute(
          builder: (context) => const CarroListScreen(),
        );
      case Routes.detalhesScreen:
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final CarroModel carroName = arguments['carroName'];
        return MaterialPageRoute(
          builder: (context) => CarroDetalhesScreen(
            carro: carroName,
          ),
        );

      default:
        return MaterialPageRoute(builder: (context) => const Placeholder());
    }
  }
}
