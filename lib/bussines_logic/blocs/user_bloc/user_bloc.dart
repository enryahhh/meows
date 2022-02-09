import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meows_co/bussines_logic/blocs/blocs.dart';
import 'package:equatable/equatable.dart';
import 'package:meows_co/data/models/models.dart';
import 'package:meows_co/data/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthBloc authBloc;
  late final StreamSubscription authBlocSubscription;

  UserBloc({required this.authBloc}) : super(UserLoading())  {
    authBlocSubscription = authBloc.stream.listen((state) {
        // React to state changes here.
        // Add events here to trigger changes in MyBloc.
        print('${state} ini listener');
        if(state is Authenticated){
          add(GetUserPref());
        }else if(state is Unauthenticated){
          print('waaaww');
        }
    });

    on<GetUserPref>((event, emit) => _onGetUserPref(event,emit));
  }
  Future<void> _onGetUserPref(GetUserPref event, Emitter<UserState> emit) async {
    print(authBlocSubscription);
    emit(UserLoading());
    UserAPI user = await AuthAPIServices().getUserPref();
    emit(UserLoaded(user));
  }

  @override
  Future<void> close() {
    authBlocSubscription.cancel();
    return super.close();
  }
}
