import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  final String baseUrl;

  ApiController({required this.baseUrl});

  Map<String, String> getHeaders() {
    return {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*', // Replace with the actual origin of your Flutter app
    };
  }

  Future<http.Response> sendGetRequest(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: getHeaders(),
      );
      return response;
    } catch (error) {
      print('Error in sendGetRequest: $error');
      throw error;
    }
  }

  Future<http.Response> sendPostRequest(String endpoint, dynamic jsonBody) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        body: jsonBody,
        headers: getHeaders(),
      );
      return response;
    } catch (error) {
      print('Error in sendPostRequest: $error');
      throw error;
    }
  }

  Future<http.Response> sendPutRequest(String endpoint, dynamic jsonBody) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        body: jsonBody,
        headers: getHeaders(),
      );
      return response;
    } catch (error) {
      print('Error in sendPutRequest: $error');
      throw error;
    }
  }

  Future<http.Response> sendDeleteRequest(String endpoint) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: getHeaders(),
      );
      return response;
    } catch (error) {
      print('Error in sendDeleteRequest: $error');
      throw error;
    }
  }
}
