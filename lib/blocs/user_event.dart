part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent{
  final String id;

  LoadUser(this.id);
  @override
  List<Object> get props => [id];
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
