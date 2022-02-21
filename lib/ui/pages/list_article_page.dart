part of 'pages.dart';

class ListArticlePage extends StatefulWidget {
  const ListArticlePage({Key? key}) : super(key: key);

  @override
  _ListArticlePageState createState() => _ListArticlePageState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _ListArticlePageState extends State<ListArticlePage> {
  final _debouncer = Debouncer();
  List<Post> _postsFind = [];
  List<Post> _postAll = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                  child: Column(children: [
                Container(
                    margin: EdgeInsets.only(bottom: 32),
                    padding: EdgeInsets.all(10),
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Color(0xffff1f2f6),
                      ),
                      child: TextField(
                          decoration: InputDecoration(
                            fillColor: Color(0xffff1f2f6),
                            filled: true,
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Icon(Icons.search,
                                color: Color(0xfff7f8c8d), size: 30),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xfffced6e0))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Color(0xffff1f2f6))),
                            hintStyle: TextStyle(color: Color(0xfff7f8c8d)),
                            hintText: 'Search',
                          ),
                          onChanged: (string) {
                            _debouncer.run(() {
                              setState(() {
                                _postAll = _postsFind
                                    .where(
                                      (u) => (u.title.toLowerCase().contains(
                                            string.toLowerCase(),
                                          )),
                                    )
                                    .toList();
                              });
                            });
                          }),
                    )),
                BlocConsumer<PostBloc, PostState>(listener: (context, state) {
                  if (state is PostLoaded) {
                    setState(() {
                      _postAll = state.post;
                      _postsFind = _postAll;
                    });
                  }
                }, builder: (context, state) {
                  if (state is PostLoadFailure) {
                    return NoConnection(
                        cobaLagi: () {
                          context.read<PostBloc>().add(FetchPost(true, false));
                        },
                        pesanError: "Terjadi Kesalahan");
                  } else if (state is PostLoaded) {
                    return ListView.builder(
                        itemCount: _postAll.length,
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) =>
                            CardArticle(post: _postAll[i]));
                  }
                  return Center(child: CircularProgressIndicator());
                })
              ])))),
    );
  }
}
