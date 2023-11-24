import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  final String baseUrl;

  ApiController({required this.baseUrl});

  Future<http.Response> sendGetRequest(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    return response;
  }

  Future<http.Response> sendPostRequest(String endpoint, dynamic jsonBody) async {
    final response = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      body: jsonBody,
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> sendPutRequest(String endpoint, dynamic jsonBody) async {
    final response = await http.put(
      Uri.parse('$baseUrl$endpoint'),
      body: jsonBody,
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  Future<http.Response> sendDeleteRequest(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl$endpoint'));
    return response;
  }
}
