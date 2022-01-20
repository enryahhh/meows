part of 'models.dart';

class Post extends Equatable {
  final String postId;
  final String userId;
  final String title;
  final String content;
  final List<String> imgPost;
  final int likesTotal;
  final int commentsTotal;

  Post(
      {required this.postId,
      required this.userId,
      required this.title,
      required this.content,
      required this.imgPost,
      required this.likesTotal,
      required this.commentsTotal});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      postId: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['overview'],
      imgPost: json['img_post'],
      likesTotal:json['likes_total'],
      commentsTotal:json['comments_total']);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [postId, userId, title, content, imgPost, likesTotal, commentsTotal];
}
