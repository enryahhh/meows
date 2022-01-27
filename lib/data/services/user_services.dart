part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModel user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'profilePicture': user.profilePicture ?? ""
    });
  }

  static Future<UserModel> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    // UserModel user = _userCollection.where({
    //     'id' : id
    // }) as UserModel;
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserModel(snapshot.id, data['email']);
  }
}