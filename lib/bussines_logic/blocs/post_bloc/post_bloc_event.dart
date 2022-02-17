part of 'post_bloc_bloc.dart';

abstract class PostBlocEvent extends Equatable {
  const PostBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchPost extends PostBlocEvent {
  final bool isArticle;

  FetchPost(this.isArticle);

  @override
  List<Object> get props => [isArticle];
}

class CreatePost extends PostBlocEvent {
  final String title;
  final String content;
  
    CreatePost(this.title,this.content);
    @override
    List<Object> get props => [title,content];

}

class FetchDetailPost extends PostBlocEvent{
  final int idPost;

  FetchDetailPost(this.idPost);

  @override
  List<Object> get props => [idPost];
}

class CommentPost extends PostBlocEvent {
    final Comments comment;
  
    CommentPost(this.comment);
    @override
    List<Object> get props => [comment];
}