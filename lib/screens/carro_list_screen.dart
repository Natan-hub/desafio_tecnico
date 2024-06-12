import 'package:desafio_tecnico/components/app_bar_padrao.dart';
import 'package:desafio_tecnico/providers/carro_provider.dart';
import 'package:desafio_tecnico/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarroListScreen extends StatefulWidget {
  const CarroListScreen({super.key});

  @override
  State<CarroListScreen> createState() => _CarroListScreenState();
}

class _CarroListScreenState extends State<CarroListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<CarrroProvider>(context, listen: false).fetchCarros(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComponente(
        isTitulo: 'Carros',
      ),
      body: Consumer<CarrroProvider>(
        builder: (context, carProvider, child) {
          if (carProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            itemCount: carProvider.cars.length,
            itemBuilder: (context, index) {
              final carro = carProvider.cars[index];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  leading: Container(
                    clipBehavior: Clip.hardEdge,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: const Icon(
                      Icons.directions_car_filled_rounded,
                      size: 35,
                    ),
                  ),
                  title: Text(
                    carro.nomeModelo,
                    style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w700, color: Colors.black),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ano: ${carro.ano}',
                      ),
                      Text('Valor: R\$ ${carro.valor.toStringAsFixed(3)}'),
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detalhesScreen,
                      arguments: {'carroName': carro},
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
