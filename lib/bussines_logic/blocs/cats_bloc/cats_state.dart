part of 'cats_bloc.dart';

abstract class CatsState extends Equatable {
  const CatsState();
  
  @override
  List<Object> get props => [];
}

class CatsInitial extends CatsState {
  
}

class CatsLoading extends CatsState {}
class CatsLoaded extends CatsState {
  final List<Cats> cats;

  CatsLoaded(this.cats);
  @override
  List<Object> get props => [cats];
}
class CatsLoadFailure extends CatsState {}

class CatsCreateSuccess extends CatsState {
  // final Cats cat;

  CatsCreateSuccess();

  @override
  List<Object> get props => [];
}

