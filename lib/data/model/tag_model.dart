class Tag {
  Tag({
    this.id,
    this.title,
  });

  String id;
  String title;

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      title: json['title'],
    );
  }
}