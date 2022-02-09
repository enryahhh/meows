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

class PostDetailLoaded extends PostState{
  final PostDetail postDetail;

  PostDetailLoaded(this.postDetail);

  @override
  List<Object> get props => [postDetail];
}

class PostLoadFailure extends PostState {}

class ArticleLoaded extends PostState{}
