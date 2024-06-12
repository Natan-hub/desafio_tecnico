import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:desafio_tecnico/models/carro_model.dart';

class ApiService {
  static const String baseUrl = 'https://wswork.com.br/cars.json';

  Future<List<CarroModel>> fetchCars() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> carList = jsonResponse['cars'];
      List<CarroModel> cars =
          carList.map((dynamic item) => CarroModel.fromJson(item)).toList();
      return cars;
    } else {
      print('Erro ao carregar os dados');
      throw Exception('Failed to load cars');
    }
  }
}

class LeadService {
  final String apiUrl =
      'https://lead.wiremockapi.cloud/thing/1'; // URL corrigida

  Future<void> postLead(Map<String, dynamic> leadData) async {
    try {
      print(
          'Sending lead data: ${jsonEncode(leadData)}'); // Log dos dados enviados
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(leadData),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Lead posted successfully
        print('Lead posted successfully: ${response.body}');
      } else {
        // Failed to post lead
        print('Failed to post lead: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to post lead');
      }
    } catch (e) {
      print('Error posting lead: $e');
      throw Exception('Failed to post lead: $e');
    }
  }
}
