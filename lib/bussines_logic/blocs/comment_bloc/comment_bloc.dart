import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meows_co/bussines_logic/blocs/blocs.dart';
import 'package:meows_co/data/models/models.dart';
import 'package:meows_co/data/services/services.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  PostServices _postServices = new PostServices();
  CommentBloc() : super(CommentInitial()) {
    on<CreateComment>((event, emit) => _onCreateComment(event,emit));

    on<GetComment>((event,emit) => _onCommentFetched(event,emit));
  }

  Future<void> _onCommentFetched(GetComment event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final result = await _postServices.getComments(event.post);
    // final posts = await PostServices().getListPostFb();
    
    if(result.code != "200"){
      emit(CommentLoadFailure());
    }else{
      emit(CommentLoaded(result.data));
    }
  }

  Future<void> _onCreateComment(CreateComment event, Emitter<CommentState> emit) async {
    emit(CommentLoading());
    final result = await _postServices.newComment(event.text,event.idPost);
    if(result.code != "200"){
      emit(CommentLoadFailure());
    }else{
      emit(CommentCreateSuccess(result.data));
    }
  }
}
