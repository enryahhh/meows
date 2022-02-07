import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meows_co/bussines_logic/blocs/blocs.dart';
import 'package:meows_co/data/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AppStart>((event, emit) => _onAppStarted(event, emit));

    on<LoginEvent>((event, emit) => _onLoginEvent(event,emit));

    on<LogoutEvent>((event, emit) => _onLogoutEvent(event,emit));

    on<RegisterEvent>((event, emit) => _onRegisterEvent(event,emit));
  }
  Future<void> _onAppStarted(AppStart event, Emitter<AuthState> emit) async {
    final bool hasToken = await AuthAPIServices().hasToken();
    if (hasToken) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit)async{
    emit(AuthLoading());
    AuthResult authResult = await AuthAPIServices().login(event.email, event.password);
    if(authResult.status == "success"){
      emit(Authenticated());
    }else{
      emit(AuthFailed(authResult.message));
      emit(Unauthenticated());
    }
  }

  Future<void> _onLogoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    await AuthAPIServices().logout();
    emit(AuthLoading());
    emit(Unauthenticated());
  }

  Future<void> _onRegisterEvent(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    AuthResult authResult = await AuthAPIServices().register(event.nama,event.email, event.password,event.confirmpass);
    if(authResult.status == "success"){
      emit(Authenticated());
    }else{
      emit(AuthFailed(authResult.message));
      emit(Unauthenticated());
    }
  }
}
