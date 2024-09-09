import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final String profileUrl;

  User(this.name, this.profileUrl);
}

final userProvider = Provider<User>((ref) {
  return User('Gbolahan', 'https://via.placeholder.com/150');
});
