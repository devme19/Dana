class Files {
  Files({
    this.id,
    this.file,
    this.fileType,
  });

  String id;
  String file;
  String fileType;
  factory Files.fromJson(Map<String, dynamic> json) {
    return Files(
      id: json['id'],
      fileType: json['file_type'],
      file: json['file'],
    );
  }
}