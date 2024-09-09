import 'dart:convert';
import 'package:passion_purpose/core/services/api_routes.dart';
import 'package:passion_purpose/core/services/config.dart';
import 'package:passion_purpose/core/services/http_service.dart';
import 'package:passion_purpose/features/contact/models/book_appointment_request.dart';
import 'package:passion_purpose/features/contact/models/book_appointment_response.dart';

class ApiService {
  final HttpService httpService;

  ApiService(this.httpService);

  Future<BookAppointmentSuccessResponse> bookAppointment(
      BookAppointmentRequest request) async {
    try {
      final requestJson = json.encode(request.toJson());

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Config.apiToken}',
      };
      String url = ApiRoutes.bookAppointment;
      final response = await httpService.post(
        url,
        body: requestJson,
        headers: headers,
        requiresToken: true,
      );

      print('Received response from /book_appointment: ${response.body}');

      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);

        return BookAppointmentSuccessResponse.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to book appointment: ${response.reasonPhrase}');
      }
    } catch (e, stackTrace) {
      print('Exception caught: $e');
      print('Stack trace: $stackTrace');
      rethrow;
    }
  }
}
