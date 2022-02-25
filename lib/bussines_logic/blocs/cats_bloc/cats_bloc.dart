import 'dart:io';

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
    on<AddCat>((event,emit) => _onCreateCat(event,emit));
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

  Future<void> _onCreateCat(AddCat event, Emitter<CatsState> emit) async {
    emit(CatsLoading());
    final result = await _catServices.newCat(event.namaKucing, event.jk, event.birth, event.ras, event.photo);
    if(result == null){
      emit(CatsLoadFailure());
    }else{
      emit(CatsCreateSuccess());
    }
  }

}
