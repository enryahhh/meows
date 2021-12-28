part of 'extensions.dart';

extension FireBaseUsersExtension on User {
  UserModel convertToUser({String name ="No Name"}) =>
      UserModel(this.uid, this.email,name: name);

    Future<UserModel> fromFireStore() async => await UserServices.getUser(this.uid);
}
