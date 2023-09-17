class Plan {
  String title;
  String? description;
  DateTime? created_at;

  Plan({required this.title, this.created_at, this.description});

  static Plan fromJson(Map<String, dynamic> data) {
    return Plan(
      title: data['title'],
      description: data['description'],
      //created_at: data['created_at']
    );
  }
}
