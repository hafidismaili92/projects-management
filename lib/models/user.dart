class User {
  String id = '';
  String email = '';

  String name = '';
  String? avatarUrl = '';
  DateTime? lastActive;
  User(
      {required this.id,
      required this.email,
      required this.name,
      this.avatarUrl,
      this.lastActive});
}
