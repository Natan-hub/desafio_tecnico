import 'package:flutter/material.dart';

class Voltar extends StatelessWidget {
  const Voltar({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 30,
        color: Colors.white,
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}
