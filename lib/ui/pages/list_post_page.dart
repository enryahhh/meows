part of 'pages.dart';

class ListPostPage extends StatefulWidget {
  const ListPostPage({Key? key}) : super(key: key);

  @override
  ListPostPageState createState() => ListPostPageState();
}

class ListPostPageState extends State<ListPostPage> {
  @override
  Widget build(BuildContext context) {
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
            Text("Postingan Terbaru",
                style: darkPurpleTextFont.copyWith(fontSize: 26)),
            BlocBuilder<PostBloc, PostState>(builder: (context, state) {
              print(state);
              if (state is PostLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if(state is PostLoadFailure){
                return Text("oops somtehing went wrong");
              }
              if (state is PostLoaded) {
                return Container(
                  height: SizeDevice(context).heightDevice - 140,
                  child: ListView.builder(
                      itemCount: state.post.length,
                      itemBuilder: (ctx, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => PostDetailPage()));
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 5),
                              width: double.infinity,
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(children: [
                                          Container(
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/user_pic.png"),
                                                          fit: BoxFit.cover)),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "${state.post[i].user.name}",
                                                            style: darkPurpleTextFont
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                        SizedBox(height: 5),
                                                        Text("3 hours ago",
                                                            style: TextStyle(
                                                                fontSize: 11),
                                                            textAlign:
                                                                TextAlign.left)
                                                      ],
                                                    ))
                                              ]))
                                        ]),
                                      ),
                                      Container(
                                        child: Text("${state.post[i].title}",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(fontSize: 20)),
                                      ),
                                      SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 6.0, bottom: 2.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () => {},
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(Icons.thumb_up,
                                                        size: 18,
                                                        color: Colors.black),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0,
                                                              right: 8.0),
                                                      child: Text(
                                                        'Like ( 2 )',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    Icon(Icons.comment_bank,
                                                        size: 18,
                                                        color: Colors.black),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                        'Comment ( ${state.post[i].commentsTotal} )',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      )
                                    ]),
                              ))),
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
