part of 'widgets.dart';

class CardPost extends StatefulWidget {
  final Post post;
  final bool isDetail;
  CardPost({Key? key,required this.post,required this.isDetail}) : super(key: key);

  @override
  _CardPostState createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5),
        width: double.infinity,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/user_pic.png"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${widget.post.user.name}",
                                  style: darkPurpleTextFont.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(height: 5),
                              Text(timeago.format(DateTime.parse(widget.post.createdAt),locale: 'id'),
                                  style: TextStyle(fontSize: 11),
                                  textAlign: TextAlign.left)
                            ],
                          ))
                    ]))
              ]),
            ),
            Container(
              child: Text("${widget.post.title}",
                  textAlign: TextAlign.start, style: TextStyle(fontSize: 20)),
            ),
            SizedBox(height: 15),
            Text(
                widget.post.content,
                overflow: widget.isDetail ? TextOverflow.visible :TextOverflow.ellipsis,
                style: TextStyle(height: 1.5)),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => {},
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.thumb_up, size: 18, color: Colors.black),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 8.0, right: 8.0),
                          //   child: Text(
                          //     'Like ( ${widget.post.likesTotal} )',
                          //     style: TextStyle(
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black),
                          //   ),
                          // ),
                          Icon(Icons.comment_bank,
                              size: 18, color: Colors.black),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Comment ( ${widget.post.commentsTotal} )',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )
          ]),
        )));
  }
}
