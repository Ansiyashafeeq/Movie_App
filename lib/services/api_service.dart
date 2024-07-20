// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/show.dart';
import '../models/cast.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

  Future<List<Show>> getAllShows() async {
    final response = await http.get(Uri.parse('$baseUrl/shows'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((show) => Show.fromJson(show)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<Cast>> getCastByShow(int showId) async {
    final response = await http.get(Uri.parse('$baseUrl/shows/$showId/cast'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((cast) => Cast.fromJson(cast)).toList();
    } else {
      throw Exception('Failed to load cast');
    }
  }
}
