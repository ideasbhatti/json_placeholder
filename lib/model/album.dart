class Album {
  final int? userId;
  final String title;
  final int? id;

  Album({required this.id, required this.title, required this.userId});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      userId: json['userID'],
      title: json['title'],
    );
  }
}
