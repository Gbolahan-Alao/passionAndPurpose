class ApiRoutes {
  static const String bookAppointment = '/appointment';
  static const String getAllAppointments = '/appointment';
  static const String getUserAppointments = '/appointment/user';

  static String getAppointmentById(String id) => '/appointment/$id';

  static String cancelAppointment(String appointmentId) =>
      '/appointment/$appointmentId/cancel';

  static String deleteAppointment(String appointmentId) =>
      '/appointment/$appointmentId';
}
