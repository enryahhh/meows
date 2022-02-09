part of 'services.dart';

class UserServices {
  Dio dio = Dio();
  Future<void> setToken() async{
    String _token = await AuthAPIServices().getToken();
    dio = ConfigAPI().getDio(_token);
  }

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

  Future<UserAPI> getUserApi(String id) async {
    await setToken();
    late final UserAPI user;
    await setToken();
    try {
      final Response response = await dio.get(urlApi + "post/" + id.toString());
      var result = response.data['data']['user'];
      user = UserAPI.fromJson(result);
      print('user');
    } catch (e) {
      print(e.toString());
    }
    return user;
  }
}