part of 'services.dart';

class AuthAPIServices {
  Dio _dio = Dio();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late SharedPreferences prefs;
  Future<void> sharedPrefInit() async {
    prefs = await _prefs;
  }

  Future<bool> hasToken() async {
    final SharedPreferences prefs = await _prefs;
    if (prefs.getString('token') != null) {
      return true;
    }
    return false;
  }

  Future<void> persistToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('token', token);
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove('token');
  }

  Future<String> getToken() async{
    final SharedPreferences prefs = await _prefs;
    late String token;
    if(await hasToken()){
      token = prefs.getString('token')!;
    }else{
      token = "";
    }
    return token;
  }

  


  Future<AuthResult> register(String nama,String email,String password,String confirmpass) async{
    _dio.interceptors.add(CustomInterceptor());
    late AuthResult authResult;
    try{
      final result = await _dio.post(urlApi + "auth/register",data: {
        "name" : nama,
        "email" : email,
        "password" : password,
        "password_confirmation" : confirmpass
      });
      persistToken(result.data['data']['token']);
      print(result.data['data']);
      await prefs.setString('user', json.encode(result.data['data']['user']));
      authResult = AuthResult(status:result.data['status'],message: result.data['message']);
    }on DioError catch(e){
      print(e);
      print(e.toString());
          if (e.response != null) {
            print(e.response!.data);
            print(e.response!.headers);
            print(e.response!.requestOptions);
          authResult = AuthResult(status:e.response!.data['status'],message: e.response!.data['message']);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return authResult;
  }


  Future<AuthResult> login(String email,String password) async{
    _dio.interceptors.add(CustomInterceptor());
    final SharedPreferences prefs = await _prefs;
    late AuthResult authResult;
    try{
      final result = await _dio.post(urlApi + "auth/login",data: {
        "email" : email,
        "password" : password
      });
      persistToken(result.data['data']['token']);
      print(result.data['data']);
      UserAPI user = UserAPI.fromJson(result.data['data']['user']);
      authResult = AuthResult(status:result.data['status'],message: result.data['message'],user:user);
      await prefs.setString('user', json.encode(result.data['data']['user']));
    }on DioError catch(e){
      print(e);
      print(e.toString());
          if (e.response != null) {
            print(e.response!.data);
            print(e.response!.headers);
            print(e.response!.requestOptions);
          authResult = AuthResult(status:e.response!.data['status'],message: e.response!.data['message']);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
    return authResult;
  }

  Future<void> logout()async{
    final SharedPreferences prefs = await _prefs;
    try{
      String token = await getToken();
      _dio = ConfigAPI().getDio(token);
      final res = await _dio.post(urlApi + "auth/logout");
      print("ini logout ${res.data['message']}");
      if(res.data['message'] != null){
        await deleteToken();
        await prefs.remove('user');
      }
    }catch(e){
      print(e.toString());
    }
  }
}

class AuthResult {
  final String? status;
  final String? message;
  final String? token;
  final UserAPI? user;
  AuthResult({this.status, this.message, this.token,this.user});
}
