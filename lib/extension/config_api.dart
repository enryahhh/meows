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
    return _dio;
  //}
  }
}
