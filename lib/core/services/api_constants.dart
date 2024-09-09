class ApiConstants {
  static const String baseUrl = 'https://your-api-domain.com/api';

  // API Endpoints
  static const String contactUsEndpoint = '/contact-us';

  // Manually set token for now (you can later set it dynamically)
  static String token = 'your-manual-token-here';

  // Full API route for contact us
  static String getContactUsUrl() => '$baseUrl$contactUsEndpoint';
}
