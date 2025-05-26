import 'package:flutter/material.dart';
import '../repository/service_repository.dart';
import '../models/service_model.dart';

class ServiceViewModel extends ChangeNotifier {
  final ServiceRepository _repository = ServiceRepository();
  
  List<ServiceModel> services = [];
  bool isLoading = false;
  String? error;

  ServiceViewModel() {
    loadServices();
  }

  Future<void> loadServices() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      services = await _repository.getServices();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    error = null;
    notifyListeners();
  }
}