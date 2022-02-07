part of 'post_bloc_bloc.dart';

 class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostCreateSuccess extends PostState {
  
}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> post;

  PostLoaded(this.post);

  @override
  List<Object> get props => [post];
}

class PostLoadFailure extends PostState {}
