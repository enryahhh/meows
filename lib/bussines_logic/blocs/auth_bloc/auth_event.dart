part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStart extends AuthEvent{}

class LoginEvent extends AuthEvent{
  final String email;
  final String password;

  LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [email,password];
}

class RegisterEvent extends AuthEvent{
  final String nama;
  final String email;
  final String password;
  final String confirmpass;

  RegisterEvent(this.nama,this.email, this.password, this.confirmpass);

  @override
  List<Object> get props => [email,password];
}

class LogoutEvent extends AuthEvent{}