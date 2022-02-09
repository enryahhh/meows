part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class CreateComment extends CommentEvent{
  final String text;
  final int idPost;

  CreateComment(this.text,this.idPost);

  @override
  List<Object> get props => [text,idPost];
}

class GetComment extends CommentEvent{
  final Post post;

  GetComment(this.post);

  @override
  List<Object> get props => [post];
}
