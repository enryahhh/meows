part of 'services.dart';

class CatServices {
  Dio dio = Dio();
  Future<void> setToken() async {
    String _token = await AuthAPIServices().getToken();
    dio = ConfigAPI().getDio(_token);
  }

  Future<APIResult> getListCat() async {
    late final List cats;
    late String code;
    late List<Cats> data;
    // String token = await AuthAPIServices().getToken();
    //   dio = ConfigAPI().getDio(token);
    await setToken();
    print("ini get cats");
    try {
      final Response response = await dio.get(urlApi+"cat");
      
      print("ini get post ${response.data}");
      // debugPrint(tes2.toString());
      if (response.statusCode == 200) {
        code = "200";
        if(response.data['data']['cats'] != null){
          cats = response.data['data']['cats'];
          data = cats.map((e) => Cats.fromJson(e)).toList();
          print(data);
        }else{
          data = [];
        }
      }
      
      
    } on DioError catch (e) {
      print("ini error");
      if (e.response != null) {
        print(e.response?.data ?? "response.data error");
        print(e.response?.headers ?? "response.header error");
        print(e.response?.requestOptions ?? "response.header req option");
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      code = "500";
      data = [];

      print(e.toString());
    }
    return APIResult(code, data);
  }

  Future<Response?> newCat(String nama_kucing, String jk, String? birth,String? ras,File? photo) async {
    await setToken();
    var formData = FormData.fromMap({'nama_kucing': nama_kucing, 'jk': jk, 'birth': birth,'ras': ras,'photo':photo != null ? await MultipartFile.fromFile(photo.path,) : null });
    late Response? response;
    try {
      response = await dio.post(urlApi + "cat",
          data: formData);
      print("ini post " + response.toString());
    } catch (e) {
      response = null;
      print(e.toString());
    }
    return response;
  }

  Future<PostDetail?> getPostDetail(int id) async {
    late final PostDetail postD;
    late List commentsData;
    await setToken();
    try {
      final Response response = await dio.get(urlApi + "post/" + id.toString());
      var result = response.data['data']['post'];
      commentsData = result['comments'];
      final List<Comments> commentModel =
          commentsData.map((e) => Comments.fromJson(e)).toList();
      postD = PostDetail(Post.fromJson(result), commentModel);
      print(result);
    } catch (e) {
      print(e.toString());
    }
    return postD;
  }

  Future<APIResult> getComments(Post post) async {
    late List<Comments> commentsModel;
    late String code;
    await setToken();
    try {
      final Response response = await dio
          .get(urlApi + "post/" + post.postId.toString() + "/comments");
      var result = response.data['data'];
      var commentsData = result['comments'];
      print("get comment");
      commentsModel =
          (commentsData as List).map((e) => Comments.fromJson(e)).toList();
      code = "200";
      print(commentsModel);
    } catch (e) {
      print(e.toString());
    }
    return APIResult(code, (commentsModel));
  }

  Future<APIResult> newComment(String text, int id) async {
    late String code;
    late Comments commentData;
    await setToken();
    try {
      final Response response = await dio.post(
          urlApi + "post/" + id.toString() + "/comment",
          data: {"post_id": id.toString(), "comment": text});
      var result = response.data['data']['comment'];

      commentData = Comments.fromJson(result);
      print(commentData);
      if (response.statusCode == 200) {
        code = "200";
      }
    } catch (e) {
      print(e.toString());
    }
    return APIResult(code, commentData);
  }
}

