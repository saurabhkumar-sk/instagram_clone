class ApiUser {
  final String id;
  final String author;
  final int width;
  final int height;
  final String downloadUrl;

  ApiUser({
    required this.id,
    required this.author,
    required this.width,
    required this.height,
    required this.downloadUrl,
  });
  factory ApiUser.fromjson(Map<String, dynamic> json) {
    return ApiUser(
      id: json['id'],
      author: json['author'],
      width: json['width'],
      height: json['height'],
      downloadUrl: json['download_url'],
    );
  }

  get length => [];

  getRange(int offset, int limit) {}
}