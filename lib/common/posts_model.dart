class PostsModel {
  final int userId;
  final int id;
  final String title;
  // final String body;
  PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    // required this.body,
  });

  PostsModel copyWith({int? userId, int? id, String? title, String? body}) {
    return PostsModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      // body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'id': id});
    result.addAll({'title': title});
    // result.addAll({'body': body});

    return result;
  }

  factory PostsModel.fromJson(Map<String, dynamic> map) {
    return PostsModel(
      userId: map['userId'] ?? '',
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      // body: map['body'] ?? '',
    );
  }

  // String toJson() => json.encode(toMap());
  // factory PostsModel.fromJson(String source) => PostsModel.fromMap(json.decode(source));
}
