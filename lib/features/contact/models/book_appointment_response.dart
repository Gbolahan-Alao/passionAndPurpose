class BookAppointmentData {
  final int id;
  final String subject;
  final String email;
  final DateTime appointmentDate;
  final String message;
  final int status;
  final String userId;

  BookAppointmentData({
    required this.id,
    required this.subject,
    required this.email,
    required this.appointmentDate,
    required this.message,
    required this.status,
    required this.userId,
  });

  factory BookAppointmentData.fromJson(Map<String, dynamic> json) {
    return BookAppointmentData(
      id: json['id'],
      subject: json['subject'],
      email: json['email'],
      appointmentDate: DateTime.parse(json['appointmentDate']),
      message: json['message'],
      status: json['status'],
      userId: json['userId'],
    );
  }
}

class BookAppointmentSuccessResponse {
  final String status;
  final String message;
  final BookAppointmentData data;
  final dynamic error;

  BookAppointmentSuccessResponse({
    required this.status,
    required this.message,
    required this.data,
    this.error,
  });

  factory BookAppointmentSuccessResponse.fromJson(Map<String, dynamic> json) {
    return BookAppointmentSuccessResponse(
      status: json['status'],
      message: json['message'],
      data: BookAppointmentData.fromJson(json['data']),
      error: json['error'],
    );
  }
}
