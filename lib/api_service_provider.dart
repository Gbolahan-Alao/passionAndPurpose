import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passion_purpose/core/services/api_service.dart';
import 'package:passion_purpose/core/services/http_service.dart';

// Provider for HttpService
final httpServiceProvider = Provider<HttpService>((ref) {
  return HttpService();
});

// Provider for ApiService
final apiServiceProvider = Provider<ApiService>((ref) {
  final httpService = ref.watch(httpServiceProvider);
  return ApiService(httpService);
});
