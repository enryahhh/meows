part of 'services.dart';

class PostServices {
  Dio dio = Dio();
  Future<void> setToken() async {
    String _token = await AuthAPIServices().getToken();
    dio = ConfigAPI().getDio(_token);
  }

  Future<List<Post>> getListPost(bool isArticle) async {
    late final List post;
    late String url;

    if (isArticle) {
      url = urlApi + "article";
    } else {
      url = urlApi + "post";
    }
    // String token = await AuthAPIServices().getToken();
    //   dio = ConfigAPI().getDio(token);
    await setToken();
    print("ini get post");
    try {
      final Response response = await dio.get(url);
      post = response.data['data']['post'];
      print("ini get post ${response.data}");
      // debugPrint(tes2.toString());
    } on DioError catch (e) {
      print("ini error");
      if (e.response != null) {
        print(e.response?.data ?? "response.data error");
        print(e.response?.headers ?? "response.header error");
        print(e.response?.requestOptions ?? "response.header reqoption");
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
      post = [];

      print(e.toString());
    }
    return post.map((e) => Post.fromJson(e)).toList();
  }

  Future<void> newPost(String title, String content) async {
    await setToken();
    try {
      final response = await dio.post(urlApi + "post",
          data: {'title': title, 'content': content, 'thumbnail': null});
      print("ini post " + response.toString());
    } catch (e) {
      print(e.toString());
    }
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

class APIResult {
  final String code;
  final dynamic data;

  APIResult(this.code, this.data);
}
