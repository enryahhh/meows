import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBlocBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostBlocBloc() : super(PostBlocInitial()) {
    on<PostBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
