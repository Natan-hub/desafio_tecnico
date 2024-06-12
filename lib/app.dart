import 'package:desafio_tecnico/constants/const.dart';
import 'package:desafio_tecnico/providers/carro_provider.dart';
import 'package:desafio_tecnico/providers/lead-provider.dart';
import 'package:desafio_tecnico/routes/pages.dart';
import 'package:desafio_tecnico/screens/carro_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CarrroProvider()),
        ChangeNotifierProvider(create: (context) => LeadProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carros_teste',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        onGenerateRoute: Pages.generateRoute,
        home: const CarroListScreen(),
      ),
    );
  }
}
