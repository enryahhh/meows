part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();
  
  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}
class CommentLoading extends CommentState {}
class CommentLoaded extends CommentState {
  final List<Comments> comments;

  CommentLoaded(this.comments);
  @override
  List<Object> get props => [comments];
}
class CommentLoadFailure extends CommentState {}

class CommentCreateSuccess extends CommentState {
  final Comments comment;

  CommentCreateSuccess(this.comment);

  @override
  List<Object> get props => [comment];
}
