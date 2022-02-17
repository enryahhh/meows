import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meows_co/bussines_logic/blocs/blocs.dart';
import 'package:meows_co/data/models/models.dart';
import 'package:meows_co/data/services/services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthAPIServices authService = new AuthAPIServices();
  AuthBloc() : super(AuthInitial()) {
    
    on<AppStart>((event, emit) => _onAppStarted(event, emit));

    on<LoginEvent>((event, emit) => _onLoginEvent(event,emit));

    on<LogoutEvent>((event, emit) => _onLogoutEvent(event,emit));

    on<RegisterEvent>((event, emit) => _onRegisterEvent(event,emit));
  }
  // late bool isVerify;
  // Future<bool> isVerified() async => await UserServices().isVerified();

  Future<void> _onAppStarted(AppStart event, Emitter<AuthState> emit) async {
    // await AuthAPIServices().persistToken("30|QIYoZmvuxEInpBhO1BakIQ3CEAh9hr9fWdimE1QF");
    final bool hasToken = await authService.hasToken();
    print("ini hastoken appstart ${hasToken}");
    if (hasToken) {
      // isVerify = await isVerified();
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit)async{
    emit(AuthLoading());
    AuthResult authResult = await authService.login(event.email, event.password);
    if(authResult.status == "success"){
      // isVerify = await isVerified();
      emit(Authenticated());
    }else{
      emit(AuthFailed(authResult.message));
      emit(Unauthenticated());
    }
  }

  Future<void> _onLogoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    await authService.logout();
    emit(AuthLoading());
    emit(Unauthenticated());
  }

  Future<void> _onRegisterEvent(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(AuthLoading());
    AuthResult authResult = await authService.register(event.nama,event.email, event.password,event.confirmpass);
    // isVerify = await isVerified();
    if(authResult.status == "success"){
      // emit(UnVerified());
      emit(Authenticated());
    }else{
      emit(AuthFailed(authResult.message));
      emit(Unauthenticated());
    }
  }
}
