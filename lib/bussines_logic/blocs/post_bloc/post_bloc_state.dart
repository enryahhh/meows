part of 'post_bloc_bloc.dart';

abstract class PostBlocState extends Equatable {
  const PostBlocState();
  
  @override
  List<Object> get props => [];
}

class PostBlocInitial extends PostBlocState {}

class PostLoading extends PostBlocState {}

class PostLoaded extends PostBlocState {
  final List<Post> post;

  PostLoaded(this.post);

  @override
  List<Object> get props => [post];
}
