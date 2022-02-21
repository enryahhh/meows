part of 'pages.dart';

class HomePage extends StatefulWidget {
  // final bool isVerified;
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
      int _selectedIndex = 0;
      late PageController pageController;
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue
  ];

  late final List<Widget> pages;

  @override
  void initState() {
    pageController = PageController(initialPage: _selectedIndex);

  pages = [
    MainPage(),
    ListArticlePage(),
    // ListPostPage(isVerified:widget.isVerified),
    ListPostPage(),
    ProfilePage(),
    // SearchPage(color:Colors.green),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
    if(_selectedIndex == 2){
      context.read<PostBloc>().add(FetchPost(false,false));
    }else if(_selectedIndex == 1){
      context.read<PostBloc>().add(FetchPost(true,false));
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

 
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom:45.0),
        //   child: ElevatedButton(
        //       onPressed: () async {
        //         await AuthServices.signOut();
        //         Navigator.of(context).pushReplacement(
        //             MaterialPageRoute(builder: (ctx) => SignInPage()));
        //       },
        //       child: Icon(Icons.logout)),
        // ),
        // body: CustomBottomNavigation(
        //     currentPage: currentPage,
        //     tabController: tabController,
        //     colors: colors,
        //     unselectedColor: Colors.white,
        //     barColor: Colors.black,
        //     end: 2,
        //     start: 10,
        //     child: TabBarView(
        //       controller: tabController,
        //       physics: const NeverScrollableScrollPhysics(),
        //       children: pages
        //     ),),
        body:PageView(
          controller:pageController,
          onPageChanged:(index){
            setState(() {
              _selectedIndex = index;
            });
          },
          children: pages,
        ),
        bottomNavigationBar:BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: "Artikel",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap:_onItemTapped,
        )
      
    );
  }
}
