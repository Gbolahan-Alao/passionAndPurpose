class ErrorDetail {
  final List<String> appointment;
  final List<String> appointmentDate;

  ErrorDetail({
    required this.appointment,
    required this.appointmentDate,
  });

  // Factory constructor to create ErrorDetail from JSON
  factory ErrorDetail.fromJson(Map<String, dynamic> json) {
    return ErrorDetail(
      appointment: List<String>.from(json['appointment'] ?? []),
      appointmentDate: List<String>.from(json['appointmentDate'] ?? []),
    );
  }
}

class ErrorResponse {
  final ErrorDetail errors;
  final String type;
  final String title;
  final int status;
  final String traceId;

  ErrorResponse({
    required this.errors,
    required this.type,
    required this.title,
    required this.status,
    required this.traceId,
  });

  // Factory constructor to create ErrorResponse from JSON
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      errors: ErrorDetail.fromJson(json['errors']),
      type: json['type'],
      title: json['title'],
      status: json['status'],
      traceId: json['traceId'],
    );
  }
}
