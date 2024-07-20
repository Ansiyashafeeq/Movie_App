// lib/providers/show_provider.dart
import 'package:flutter/material.dart';
import '../models/show.dart';
import '../models/cast.dart';
import '../services/api_service.dart';

class ShowProvider with ChangeNotifier {
  List<Show> _shows = [];
  List<Cast> _cast = [];
  bool _isLoading = false;

  List<Show> get shows => _shows;
  List<Cast> get cast => _cast;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchAllShows() async {
    _isLoading = true;
    notifyListeners();
    _shows = await _apiService.getAllShows();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCastByShow(int showId) async {
    _isLoading = true;
    notifyListeners();
    _cast = await _apiService.getCastByShow(showId);
    _isLoading = false;
    notifyListeners();
  }
}
