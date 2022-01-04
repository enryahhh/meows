part of 'pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue
  ];

  late final List<Widget> tes;
  late final List<Widget> pages;

  @override
  void initState() {
    tes = [
    Container(
        width: 347,
        height: 243,
        margin: EdgeInsets.only(bottom: 3),
        child: Card(
          elevation: 5,
        )),
    Container(
        width: 347,
        height: 243,
        margin: EdgeInsets.only(bottom: 3),
        child: Card(
          elevation: 5,
        )),
  ];

  pages = [
    MainPage(tes: tes),
    ...colors.map((e) => SearchPage(color: e)).toList()
  ];
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage) {
          changePage(value);
        }
        print(value);
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

 
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        // floatingActionButton: ElevatedButton(
        //     onPressed: () async {
        //       await AuthServices.signOut();
        //       Navigator.of(context).pushReplacement(
        //           MaterialPageRoute(builder: (ctx) => SignInPage()));
        //     },
        //     child: Icon(Icons.logout)),
        body: CustomBottomNavigation(
            currentPage: currentPage,
            tabController: tabController,
            colors: colors,
            unselectedColor: Colors.white,
            barColor: Colors.black,
            end: 2,
            start: 10,
            child: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: pages
            ),),
        // body: 
      
    );
  }
}
