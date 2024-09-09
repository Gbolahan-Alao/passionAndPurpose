// exceptions.dart
class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() {
    return 'ServerException: $message';
  }
}

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() {
    return 'NetworkException: $message';
  }
}

class TokenExpiredException implements Exception {
  final String message;

  TokenExpiredException(this.message);

  @override
  String toString() {
    return 'TokenExpiredException: $message';
  }
}

// Add more custom exceptions as needed
