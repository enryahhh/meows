part of 'pages.dart';

class ListPostPage extends StatefulWidget {
  // final bool isVerified;
  ListPostPage({Key? key}) : super(key: key);

  @override
  ListPostPageState createState() => ListPostPageState();
}

class ListPostPageState extends State<ListPostPage> {
  @override
  Widget build(BuildContext context) {
  timeago.setLocaleMessages('id', timeago.IdMessages());
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: CircleBorder(),
                padding: EdgeInsets.all(16)),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => NewPostPage()));
            },
            child: Icon(Icons.add)),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Center(
          child: Column(children: [
            SizedBox(height: 20),
            Text("Postingan",
                style: darkPurpleTextFont.copyWith(fontSize: 26)),
            BlocBuilder<PostBloc, PostState>(builder: (context, state) {
              print(state);
              if (state is PostLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if(state is PostLoadFailure){
                return NoConnection(pesanError: "Terjadi kesalahan",cobaLagi: (){
                  context.read<PostBloc>().add(FetchPost(false));
                });
              }
              if (state is PostLoaded) {
                return Container(
                  height: SizeDevice(context).heightDevice - 140,
                  child: ListView.builder(
                      itemCount: state.post.length,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          onTap: () {
                            // context.read<PostBloc>().add(FetchDetailPost(state.post[i].postId));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PostDetailPage(post:state.post[i])));
                          },
                          child: CardPost(post:state.post[i],isDetail:false),
                        );
                      }),
                );
              }
              return Container();
            })
          ]),
        ),
      )),
    );
  }
}
