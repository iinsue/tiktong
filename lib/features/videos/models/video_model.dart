class VideoModel {
  final String title;
  final String description;
  final String fileUrl;
  final String thumbnailUrl;
  final int likes;
  final int comments;
  final String creator;
  final String creatorUid;
  final int createdAt;

  VideoModel({
    required this.description,
    required this.fileUrl,
    required this.creator,
    required this.thumbnailUrl,
    required this.likes,
    required this.comments,
    required this.creatorUid,
    required this.createdAt,
    required this.title,
  });

  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "fileUrl": fileUrl,
      "creator": creator,
      "thumbnailUrl": thumbnailUrl,
      "likes": likes,
      "comments": comments,
      "creatorUid": creatorUid,
      "createdAt": createdAt,
      "title": title,
    };
  }
}
