part of 'post_bloc_bloc.dart';

abstract class PostBlocEvent extends Equatable {
  const PostBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchPost extends PostBlocEvent {
  
}

class CreatePost extends PostBlocEvent {
  final Post post;
  
    CreatePost(this.post);
    @override
    List<Object> get props => [post];

}

class CommentPost extends PostBlocEvent {
    final Comments comment;
  
    CommentPost(this.comment);
    @override
    List<Object> get props => [comment];
}