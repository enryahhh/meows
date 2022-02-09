part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent{
  final String token;

  LoadUser(this.token);
  @override
  List<Object> get props => [token];
}

class GetUserPref extends UserEvent{
  
}

class SignOut extends UserEvent{
  @override
  List<Object> get props => [];
}

class UpdateData extends UserEvent{
  late final String name;
  late final String profileImage;

  UpdateData({required this.name,required this.profileImage});

  @override
  List<Object> get props => [name,profileImage];
}
