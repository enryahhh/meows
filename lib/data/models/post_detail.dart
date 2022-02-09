part of 'models.dart';

class PostDetail extends Post{
  final List<Comments> comments;
  PostDetail(Post post,this.comments) : super(
    postId: post.postId,
    userId: post.userId,
    title: post.title,
    content: post.content,
    commentsTotal: post.commentsTotal,
    likesTotal: post.likesTotal,
    user:post.user,
    createdAt: post.createdAt
  );
  
  @override
  List<Object?> get props => super.props + [comments];
  
}