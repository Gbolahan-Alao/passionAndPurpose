import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeMessageProvider = Provider<String>((ref) {
  return 'Hello from Riverpod!';
});
