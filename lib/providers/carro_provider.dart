import 'package:desafio_tecnico/models/carro_model.dart';
import 'package:desafio_tecnico/services/api_service.dart';
import 'package:flutter/material.dart';

class CarrroProvider with ChangeNotifier {
  List<CarroModel> _cars = [];
  bool _isLoading = false;

  List<CarroModel> get cars => _cars;
  bool get isLoading => _isLoading;

  Future<void> fetchCarros() async {
    _isLoading = true;
    notifyListeners();
    try {
      _cars = await ApiService().fetchCars();
    } catch (error) {
      print('Erro ao buscar os carros: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
