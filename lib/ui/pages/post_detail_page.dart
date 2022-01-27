part of 'pages.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       child:FutureBuilder(builder: (ctx,AsyncSnapshot snapshot){
         return Container();
       },
       future:PostServices().getPostDetail(1)
       ) 
      ),
    );
  }
}