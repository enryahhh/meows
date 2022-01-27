part of 'post_bloc_bloc.dart';

abstract class PostBlocState extends Equatable {
  const PostBlocState();
  
  @override
  List<Object> get props => [];
}

class PostBlocInitial extends PostBlocState {}
