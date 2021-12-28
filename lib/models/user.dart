part of 'models.dart';

class UserModel extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? profilePicture;

  UserModel(this.id, this.email, {this.name, this.profilePicture});

  UserModel copyWith({String? name, String? profilePicture}) =>
      UserModel(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture);

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        email,
        name,
        profilePicture,
      ];
}
