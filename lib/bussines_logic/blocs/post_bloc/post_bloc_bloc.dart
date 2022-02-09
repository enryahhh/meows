import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meows_co/bussines_logic/blocs/blocs.dart';
import 'package:meows_co/data/models/models.dart';
import 'package:meows_co/data/services/services.dart';

part 'post_bloc_event.dart';
part 'post_bloc_state.dart';

class PostBloc extends Bloc<PostBlocEvent, PostState> {
  PostServices _postServices = new PostServices();
  PostBloc() : super(const PostState()) {
    
    on<FetchPost>((event, emit) => _onPostFetched(event, emit));

    on<FetchDetailPost>((event, emit) => _onPostDetailFetched(event, emit));

    on<CreatePost>((event,emit)=>_onPostCreated(event, emit));
  }

  Future<void> _onPostFetched(FetchPost event, Emitter<PostState> emit) async {
    emit(PostLoading());
    final posts = await _postServices.getListPost();
    // final posts = await PostServices().getListPostFb();
    print(posts.length);
    if(posts.length == 0){
      emit(PostLoadFailure());
    }else{
      emit(PostLoaded(posts));
    }
  }

  Future<void> _onPostDetailFetched(FetchDetailPost event, Emitter<PostState> emit) async {
    emit(PostLoading());
    final PostDetail? posts = await _postServices.getPostDetail(event.idPost);
    // final posts = await PostServices().getListPostFb();
    // print(posts);
    if(posts == null){
      emit(PostLoadFailure());
    }else{
      emit(PostDetailLoaded(posts));
    }
  }

  Future<void> _onPostCreated(CreatePost event, Emitter<PostState> emit) async{
    _postServices.newPost(event.post.title, event.post.content);
    emit(PostLoading());
    emit(PostCreateSuccess());
  }
}
