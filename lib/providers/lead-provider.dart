import 'package:flutter/foundation.dart';
import '../models/lead_model.dart';
import '../services/db_service.dart';
import '../services/api_service.dart';

class LeadProvider with ChangeNotifier {
  List<LeadModel> _leads = [];
  bool _isLoading = false;

  List<LeadModel> get leads => _leads;
  bool get isLoading => _isLoading;

  final LeadService _leadService = LeadService();

  Future<void> addLead(Map<String, dynamic> leadData) async {
    try {
      await _leadService.postLead(leadData);
      // Notify listeners if needed
      notifyListeners();
    } catch (e) {
      print('Error posting lead: $e');
    }
  }

  Future<void> fetchLeads() async {
    _isLoading = true;
    notifyListeners();
    _leads = await DBService().getLeads();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> syncLeads() async {
    try {
      for (var lead in _leads) {
        await LeadService().postLead(lead.toMap());
      }
      await DBService().clearLeads();
      _leads.clear();
      notifyListeners();
    } catch (e) {
      print('Erro ao sincronizar leads: $e');
    }
  }
}
