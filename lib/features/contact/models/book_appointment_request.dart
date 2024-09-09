class BookAppointmentRequest {
  final String subject;
  final String email;
  final DateTime appointmentDate;
  final String message;
  final String userId;

  BookAppointmentRequest({
    required this.subject,
    required this.email,
    required this.appointmentDate,
    required this.message,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'subject': subject,
      'email': email,
      'appointmentDate': appointmentDate.toIso8601String(),
      'message': message,
      'userId': userId,
    };
  }
}
