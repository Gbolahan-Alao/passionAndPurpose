import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passion_purpose/api_service_provider.dart';
import 'package:passion_purpose/core/services/api_service.dart';
import 'package:passion_purpose/features/contact/models/book_appointment_request.dart';
import 'package:passion_purpose/features/contact/models/book_appointment_response.dart';

// Updated StateNotifier class
class AppointmentNotifier
    extends StateNotifier<AsyncValue<BookAppointmentSuccessResponse?>> {
  final ApiService apiService;

  // Set initial state to idle (null data), not loading
  AppointmentNotifier(this.apiService) : super(const AsyncValue.data(null));

  Future<void> bookAppointment(BookAppointmentRequest request) async {
    state =
        const AsyncValue.loading(); // Set loading state during form submission

    try {
      final response = await apiService.bookAppointment(request);
      state = AsyncValue.data(response); // Set success state with response data
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace); // Handle errors with stack trace
    }
  }
}

// Provider for Riverpod
final appointmentProvider = StateNotifierProvider<AppointmentNotifier,
    AsyncValue<BookAppointmentSuccessResponse?>>(
  (ref) => AppointmentNotifier(ref.read(apiServiceProvider)),
);
