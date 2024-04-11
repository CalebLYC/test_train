class Album {
  int id;
  int userId;
  String title;

  Album({required this.id, required this.userId, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json["id"] as int,
      userId: json["userId"] as int,
      title: json["title"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      'userId': userId,
      'title': title,
    };
  }
}
