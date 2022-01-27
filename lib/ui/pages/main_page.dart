part of 'pages.dart';

class MainPage extends StatelessWidget {
  final List<Widget> tes;
  const MainPage({Key? key, required this.tes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Icon(Icons.search),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 23, bottom: 8),
                child: Text("Jum'at , 22 Januari 2022")),
            Text("Hari ini", style: darkPurpleTextFont.copyWith(fontSize: 26)),
            FutureBuilder(
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    print(snapshot.data);
                    if (snapshot.data.length == 0) {
                      return Text("Ooops something went wrong");
                    } else {
                      return Container(
                        height: 220,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (ctx, i) {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>PostDetailPage()));
                                },
                                child: Card(
                                    child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.all(20),
                                        child:
                                            Text("${snapshot.data[i].title}"))),
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
                future: PostServices().getListArticle()),
            // Container(
            //   width: 354,
            //   height: 306,
            //   child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               Container(
            //                 width: 150,
            //                 height: 164,
            //                 color: Color(0xFF8ADFF5),
            //               ),
            //               Container(
            //                 width: 148,
            //                 height: 125,
            //                 // margin: EdgeInsets.only(top:16),
            //                 color: Color(0xFFED5F5F),
            //               ),
            //             ]),
            //         // SizedBox(width: 17,),
            //         Column(
            //           children: [
            //             Container(
            //               width: 148,
            //               height: 125,
            //               margin: EdgeInsets.only(bottom: 16),
            //               color: Color(0xFF024873),
            //             ),
            //             Container(
            //               width: 150,
            //               height: 164,
            //               color: mainColor,
            //             ),
            //           ],
            //         )
            //       ]),
            // ),
            SizedBox(height: 31),
            Row(
              children: [
                Text("Artikel Populer",
                    style: darkPurpleTextFont.copyWith(fontSize: 24)),
              ],
            ),
            SizedBox(height: 10),

            ...tes,

            // Container(
            //   height:SizeDevice(context).heightDevice * 0.8,
            //   child: ListView(
            //     children: [
            //       Container(
            //     width:347,
            //     height: 243,
            //     margin:EdgeInsets.only(bottom:3),
            //     color:Colors.red
            //   ),
            //   Container(
            //     width:347,
            //     height: 243,
            //     margin:EdgeInsets.only(bottom:3),
            //     color:Colors.red
            //   ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
