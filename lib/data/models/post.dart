part of 'models.dart';

class UserAPI extends Equatable{
  final int id;
  final String name;

  UserAPI({required this.id,required this.name});

  factory UserAPI.fromJson(Map<String,dynamic> json) => UserAPI(
    id: json['id'],
    name: json['name']);

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}

class Post extends Equatable {
  final int postId;
  final int userId;
  final String title;
  final String content;
  // final List<String> imgPost;
  final String? thumbnail;
  final int commentsTotal;
  final UserAPI user;
  final String createdAt;

  Post(
      {required this.postId,
      required this.userId,
      required this.title,
      required this.content,
      // required this.imgPost,
      this.thumbnail,
      required this.commentsTotal,required this.user, required this.createdAt});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      postId: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      thumbnail:json['thumbnail'],
      commentsTotal:json['total_comments'],
      user: UserAPI.fromJson(json['user']),
      createdAt:json['created_at']);

  @override
  // TODO: implement props
  List<Object?> get props =>
      [postId, userId, title, content, thumbnail, commentsTotal];
}
