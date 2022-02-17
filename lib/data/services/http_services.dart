part of 'services.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

const BASE_URL = "https://meows-web.singarajaikra.my.id/api/";

class HttpService {
  Dio? _dio;
  Map<String,dynamic>? headers = {"Content-Type": "application/json","Accept":"application/json"};
  static header() => {"Content-Type": "application/json"};

  Future<HttpService> init() async {

    _dio = Dio(BaseOptions(baseUrl: BASE_URL, headers: headers));
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (requestOptions, handler) {
          print(
              "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
              "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
          return handler.next(requestOptions);
        },
        onResponse: (response, handler) {
          print("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
          return handler.next(response);
        },
        onError: (err, handler) async{
          print("Error[${err.response?.statusCode}]");
          return handler.resolve(err.response!);
        },
      ),
    );
  }

  Future<dynamic> request(
      {required String url,
      required Method method,
      String? token,
      Map<String, dynamic>? params}) async {
    Response response;

    try {
      if(token != null){
        headers!.addAll({"Authorization":"Bearer "+token});
        _dio!.options.headers = headers;
      }
      if (method == Method.POST) {
        response = await _dio!.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio!.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio!.patch(url);
      } else {
        response = await _dio!.get(url, queryParameters: params);
      }

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      }else if (response.statusCode == 422) {
        return response;
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      print(e);
      throw Exception("Not Internet Connection");
    } on FormatException catch (e) {
      print(e);
      throw Exception("Bad response format");
    } on DioError catch (e) {
      print(e);
      throw Exception(e);
    } catch (e) {
      print(e);
      throw Exception("Something wen't wrong");
    }
  }
  
}

class DioExceptions implements Exception {
   late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        message =
            _handleError(dioError.response!.statusCode, dioError.response!.data);
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

 

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return error["message"];
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}