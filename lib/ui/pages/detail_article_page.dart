part of 'pages.dart';

class DetailArticle extends StatelessWidget {
  final Post post;
  DetailArticle({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget html = Html(
      data: """${post.content}""",
      onImageError: (exception, stackTrace) {
        print(exception);
      },
    );
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: mainColor,
        ),
        SafeArea(
            child: Container(
          color: Colors.white,
        )),
        ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // note: BACKDROP
                    Stack(
                      children: <Widget>[
                        Container(
                          height: 270,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(post.thumbnail != null ? "https://meows-web.singarajaikra.my.id/storage/${post.thumbnail}" : "https://via.placeholder.com/728x90.png?text=Visit+WhoIsHostingThis.com+Buyers+GuideC/O https://placeholder.com/"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 271,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment(0, 1),
                                  end: Alignment(0, 0.06),
                                  colors: [
                                Colors.white,
                                Colors.white.withOpacity(0)
                              ])),
                        )
                      ],
                    ),
                    // note: BACK ICON
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 24),
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black.withOpacity(0.04)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                // note: JUDUL
                Container(
                  margin: EdgeInsets.fromLTRB(24, 16, 24, 6),
                  child: Text(
                    post.title,
                    textAlign: TextAlign.center,
                    style: darkPurpleTextFont.copyWith(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),

                // note: STORYLINE
                Container(
                  margin: EdgeInsets.fromLTRB(24, 24, 24, 8),
                  child: Align(alignment: Alignment.topLeft, child: html),
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }
}
