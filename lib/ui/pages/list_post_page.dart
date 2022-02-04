part of 'pages.dart';

class ListPostPage extends StatefulWidget {
  const ListPostPage({ Key? key }) : super(key: key);

  @override
  ListPostPageState createState() => ListPostPageState();
}

class ListPostPageState extends State<ListPostPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          children:[
            SizedBox(height:20),
            Text("Postingan Terbaru", style: darkPurpleTextFont.copyWith(fontSize: 26)),
            FutureBuilder(
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    print(snapshot.data);
                    if (snapshot.data.length == 0) {
                      return Text("Ooops something went wrong");
                    } else {
                      return Container(
                        height: SizeDevice(context).heightDevice - 140,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (ctx, i) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PostDetailPage()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: double.infinity,
                                  color: Colors.grey,
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                    Container(
                                                      width: 45,
                                                      height: 45,
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/user_pic.png"),
                                                              fit: BoxFit
                                                                  .cover)),
                                                    ),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text("${snapshot.data[i].user.name}",
                                                                style: darkPurpleTextFont.copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal)),
                                                            SizedBox(height: 5),
                                                            Text("3 hours ago",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left)
                                                          ],
                                                        ))
                                                  ]))
                                            ]),
                                          ),
                                          Container(
                                            child: Text(
                                                "${snapshot.data[i].title}",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontSize: 20)),
                                          ),
                                          SizedBox(height: 15),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6.0, bottom: 2.0),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () => {},
                                                    child: Row(
                                                      children: <Widget>[
                                                        Icon(Icons.thumb_up,
                                                            size: 18,
                                                            color:
                                                                Colors.black),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0,
                                                                  right: 8.0),
                                                          child: Text(
                                                            'Like ( 2 )',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                        Icon(Icons.comment_bank,
                                                            size: 18,
                                                            color:
                                                                Colors.black),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8.0),
                                                          child: Text(
                                                            'Comment ( ${snapshot.data[i].commentsTotal} )',
                                                            style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
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
                  }
                  // return ListView.builder(
                  //   itemCount: snapshot.data.,
                  //   itemBuilder: )
                  // return Text("asd");
                },
                future: PostServices().getListPost()),
          ]
        ),
      )
    );
  }
}