import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:passion_purpose/core/services/config.dart';
import 'package:passion_purpose/core/services/exceptions.dart';

class HttpService {
  final String _baseUrl = Config.baseUrl;

  Future<http.Response> _makeRequest(
    String method,
    String url, {
    Map<String, String>? headers,
    dynamic body,
    bool requiresToken = false,
  }) async {
    // Add Authorization token if required
    if (requiresToken) {
      headers = {
        ...?headers,
        'Authorization': 'Bearer ${Config.apiToken}',
      };
    }

    headers = {
      ...?headers,
      'Content-Type': 'application/json',
    };

    try {
      final Uri fullUrl = Uri.parse('$_baseUrl$url');
      http.Response response;

      switch (method) {
        case 'POST':
          response = await http.post(fullUrl, headers: headers, body: body);
          break;
        case 'GET':
          response = await http.get(fullUrl, headers: headers);
          break;
        case 'PUT':
          response = await http.put(fullUrl, headers: headers, body: body);
          break;
        case 'PATCH':
          response = await http.patch(fullUrl, headers: headers, body: body);
          break;
        case 'DELETE':
          response = await http.delete(fullUrl, headers: headers);
          break;
        default:
          throw UnsupportedError('HTTP method $method not supported');
      }

      return response;
    } catch (e) {
      throw ServerException('Request to $url failed: $e');
    }
  }

  Future<http.Response> post(
    String url, {
    Map<String, String>? headers,
    dynamic body,
    bool requiresToken = false,
  }) {
    return _makeRequest(
      'POST',
      url,
      headers: headers,
      body: body,
      requiresToken: requiresToken,
    );
  }

  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
    bool requiresToken = false,
  }) {
    return _makeRequest('GET', url,
        headers: headers, requiresToken: requiresToken);
  }

  Future<String?> _getToken() async {
    return Config.apiToken;
  }
}
