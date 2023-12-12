class PostModel {
  final int id;
  final String? title;
  final String? body;
  final int userId;
  final int? reactions;

  PostModel(
    this.id,
    this.title,
    this.body,
    this.userId,
    this.reactions,
  );

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      json['id'],
      json['title'],
      json['body'],
      json['userId'],
      json['reactions'],
    );
  }
}
