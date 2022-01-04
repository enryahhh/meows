part of 'pages.dart';

class SearchPage extends StatefulWidget {
  final Color color;
  const SearchPage({ Key? key, required this.color }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(color:widget.color,child: Text("ini search page")),
      
    );
  }
}