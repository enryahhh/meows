part of 'pages.dart';

class ListArticlePage extends StatefulWidget {
  const ListArticlePage({Key? key}) : super(key: key);

  @override
  _ListArticlePageState createState() => _ListArticlePageState();
}

class _ListArticlePageState extends State<ListArticlePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              padding:EdgeInsets.symmetric(horizontal:10),
              child: SingleChildScrollView(
                  child: Column(children: [
        Container(
            margin: EdgeInsets.only(bottom: 32),
            padding:EdgeInsets.all(10),
            child: Theme(
              data: ThemeData(
                primaryColor: Color(0xffff1f2f6),
              ),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color(0xffff1f2f6),
                    filled: true,
                    contentPadding: EdgeInsets.zero,
                    prefixIcon:
                        Icon(Icons.search, color: Color(0xfff7f8c8d), size: 30),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xfffced6e0))),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xffff1f2f6))),
                    hintStyle: TextStyle(color: Color(0xfff7f8c8d)),
                    hintText: 'Search'),
              ),
            )),
      ])))),
    );
  }
}
