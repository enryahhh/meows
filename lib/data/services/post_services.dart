part of 'services.dart';

Dio dio = ConfigAPI().getDio("lSdsa2RibP6bRvURUy6kIB7mVHS53dWsPK1u6hDV");

class PostServices {
  Future<List<Post>> getListPost() async {
    late final List post;
    try {
      // final response = await http.get(Uri.parse(urlApi + "post"), headers: {
      //   'Authorization': 'Bearer lSdsa2RibP6bRvURUy6kIB7mVHS53dWsPK1u6hDV',
      //   'Content-Type' : 'application',
      //   'Accept': 'application/json'
      // });

      // if (response.statusCode != 200) {
      //   return [];
      // }
      // final a = jsonDecode(response.data['data']);
      // Map<String, dynamic> mapPost = json.decode(response.body);
      // post = mapPost['data']['post'];
      // print(response.statusCode);
      // print(":asd"+post.toString());
      final Response response = await dio.get(urlApi+"post");
      post = response.data['data']['post'];
      // var tes1 = post.map((e) {
      //   UserAPI.fromJson(e['user']);
        
      // });
      print(response.data);
      // debugPrint(tes2.toString());
    }  catch (e) {
      // if (e.response != null) {
      //   print('asssw');
      //   print(e.response!.data);
      //   print(e.response!.statusCode);
      // } else {
      //   // Something happened in setting up or sending the request that triggered an Error
      //   print(e.requestOptions);
      //   print(e.message);
      // }
      post = [];

      print(e.toString());
    }
    return post.map((e) => Post.fromJson(e)).toList();
  }

  static Future<void> newPost(String title,String content) async {
    try{
      final response = await dio.post(urlApi+"post",data:{
      'title' : title,
      'content' : content
    });
    print("ini post "+response.toString());
    }catch(e){
      print(e.toString());
    }
  }

  Future<PostDetail> getPostDetail(int id) async{
    late final PostDetail postD;
    late List commentsData;
    try{
      final Response response = await dio.get(urlApi+"post/"+id.toString());
      var result = response.data['data']['post'];
      commentsData = result['comments'];
      final List<Comments> commentModel = commentsData.map((e) => Comments.fromJson(e)).toList();
      postD = PostDetail(Post.fromJson(result), commentModel);
      print('tes123');
    } catch(e){

      print(e.toString());
    }
    return postD;
  }
}
