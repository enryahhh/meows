part of 'extensions.dart';

class ConfigAPI {
  //  var options = BaseOptions(headers:{
  //     'Accept' : 'application/json',
  //     'Authorization' : 'Bearer' + token
  //   } );
  // ConfigAPI(this.token);
  Dio getDio(String token){
   Dio _dio = Dio(BaseOptions(headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    }));
    print("ini token ${token}");
    _dio.interceptors.add(CustomInterceptor());
    return _dio;
  //}
  }
}
