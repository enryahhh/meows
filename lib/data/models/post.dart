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
  final int likesTotal;
  final int commentsTotal;
  final UserAPI user;

  Post(
      {required this.postId,
      required this.userId,
      required this.title,
      required this.content,
      // required this.imgPost,
      required this.likesTotal,
      required this.commentsTotal,required this.user});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      postId: json['id'],
      userId: json['user_id'],
      title: json['title'],
      content: json['content'],
      likesTotal:json['total_likes'],
      commentsTotal:json['total_comments'],
      user: UserAPI.fromJson(json['user']));

  @override
  // TODO: implement props
  List<Object?> get props =>
      [postId, userId, title, content, likesTotal, commentsTotal];
}
