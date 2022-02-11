part of 'services.dart';

class UserServices {
  Dio dio = Dio();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
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

  Future<UserAPI> getUserApi() async {
    late final UserAPI user;
    await setToken();
    try {
      final Response response = await dio.get(urlApi + "me/");
      var result = response.data;
      user = UserAPI.fromJson(result);
    } catch (e) {
      print(e.toString());
    }
    return user;
  }

  Future<bool> hasUser() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('user') != null) {
      return true;
    }
    return false;
  }

  Future<UserAPI> getUserPref() async {
    final SharedPreferences prefs = await _prefs;
    late UserAPI user;
    if(await hasUser()){
      user = UserAPI.fromJson(json.decode(prefs.getString('user')!));
      
    }else{
      user = await UserServices().getUserApi();
    }
    return user;
  }
  

  Future<bool> isVerified () async {
    UserAPI user = await getUserPref();
    print("ini verif ${user}");
    if (user.isVerified != null) {
      return true;
    }
    return false;
  }
}