import 'package:test/models/user_profession.dart';

class UserInfo {
  const UserInfo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.professions,
  });

  final String id;
  final String firstName;
  final String lastName;
  final int age;
  final List<Proffesion> professions;
}
