/// Data shown on the profile screen.
class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.city,
    required this.memberSince,
  });

  final String name;
  final String email;
  final String phone;
  final String city;
  final String memberSince;

  String get initials => name
      .split(' ')
      .where((part) => part.isNotEmpty)
      .take(2)
      .map((part) => part[0])
      .join()
      .toUpperCase();
}
