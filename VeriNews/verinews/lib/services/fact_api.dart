import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:verinews/utils/news_data.dart';

class FactCheckApi {
  final endpoint =
      "https://factchecktools.googleapis.com/v1alpha1/claims:search";
  final key = "AIzaSyCKEg4qQICrm9BC4oKmO7E5T565k0yCBZs";
  final lang = 'pt-BR';

  Future<Map<String, dynamic>> fetchData({required String query}) async {
    final response = await http
        .get(Uri.parse('$endpoint?languageCode=$lang&query=$query&key=$key'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
