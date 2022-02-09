part of 'pages.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;
  PostDetailPage({Key? key, required this.post}) : super(key: key);
  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final TextEditingController _msgTextController = new TextEditingController();
  FocusNode _writingTextFocus = FocusNode();

  @override
  void initState() {
    context.read<CommentBloc>().add(GetComment(widget.post));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CardPost(
                          post: widget.post,
                          isDetail:true,
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                                "Comments (${widget.post.commentsTotal})",
                                style:
                                    darkPurpleTextFont.copyWith(fontSize: 18))),
                        BlocConsumer<CommentBloc, CommentState>(
                          listener: (context,state){
                            if(state is CommentCreateSuccess){
                              context.read<CommentBloc>().add(GetComment(widget.post));
                            }
                          },
                            builder: (context, state) {
                          if (state is CommentLoadFailure) {
                            return Text("error load");
                          }
                          if (state is CommentLoaded) {
                            if (state.comments.length != 0) {
                              return ListView.builder(
                                  itemCount: state.comments.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (ctx, i) {
                                    return CardComment(
                                        comment: state.comments[i]);
                                  });
                            } else {
                              return Text("Belum ada komentar");
                            } 
                          } else if(state is CommentCreateSuccess){
                              return CardComment(comment:state.comment);
                          }
                          return CircularProgressIndicator();
                        }),
                      ]),
                )),
            Align(
                alignment: Alignment.bottomCenter, child: Container(
                  color:mainColor,
                  child:_buildTextComposer()
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.white),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                focusNode: _writingTextFocus,
                controller: _msgTextController,
                decoration:
                    new InputDecoration.collapsed(hintText: "Write a comment",hintStyle: whiteTextFont),
              ),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 2.0),
              child:
                  new IconButton(icon: new Icon(Icons.send), onPressed: () {
                    context.read<CommentBloc>().add(CreateComment(_msgTextController.text, widget.post.postId));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
