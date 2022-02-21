import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meows_co/data/models/models.dart';
import 'package:meows_co/data/services/services.dart';

part 'cats_event.dart';
part 'cats_state.dart';

class CatsBloc extends Bloc<CatsEvent, CatsState> {
  final _catServices = new CatServices();
  CatsBloc() : super(CatsInitial()) {
    on<CatsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetCat>((event,emit) => _onCatFetched(event,emit));
  }

  Future<void> _onCatFetched(GetCat event, Emitter<CatsState> emit) async {
    emit(CatsLoading());
    final result = await _catServices.getListCat();
    // final posts = await PostServices().getListPostFb();
    
    if(result.code != "200"){
      emit(CatsLoadFailure());
    }else{
      emit(CatsLoaded(result.data));
    }
  }
}
