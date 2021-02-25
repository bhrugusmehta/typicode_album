
class Album {
  final String userId;
  final String id;
  final String albumTitle;

  Album({this.id, this.userId, this.albumTitle});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'].toString(),
      userId: json['userId'].toString(),
      albumTitle: json['title'],
    );
  }
}