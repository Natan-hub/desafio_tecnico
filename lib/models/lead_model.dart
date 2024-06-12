// lib/models/lead_model.dart
class LeadModel {
  final int id;
  final String userName;
  final String userEmail;
  final int carId;

  LeadModel({
    required this.id,
    required this.userName,
    required this.userEmail,
    required this.carId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'userEmail': userEmail,
      'carId': carId,
    };
  }
}
