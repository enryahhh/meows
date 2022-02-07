part of 'widgets.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation(
      {Key? key,
      required this.child,
      required this.currentPage,
      required this.tabController,
      required this.colors,
      required this.unselectedColor,
      required this.barColor,
      required this.end,
      required this.start})
      : super(key: key);

  final Widget child;
  final int currentPage;
  final TabController tabController;
  final List<Color> colors;
  final Color unselectedColor;
  final Color barColor;
  final double end;
  final double start;

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  void initState(){
      super.initState();
  }

  @override
  void didChangeDependencies(){
    if(widget.currentPage == 2){
    print("ini deped"+widget.currentPage.toString());
        
      }
      super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
      fit: StackFit.expand,
      alignment: Alignment.bottomCenter,
      children: [
        widget.child,
        Positioned(
          bottom: widget.start,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: Material(
                    color: widget.barColor,
                    child: TabBar(
                      indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                      controller: widget.tabController,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: widget.colors[0],
                              width: 4),
                          insets: EdgeInsets.fromLTRB(16, 0, 16, 8)),
                      tabs: [
                        SizedBox(
                          height: 55,
                          width: 40,
                          child: Center(
                              child: Icon(
                            Icons.home,
                            color: widget.currentPage == 0
                                ? widget.colors[0]
                                : widget.unselectedColor,
                          )),
                        ),
                        SizedBox(
                          height: 55,
                          width: 40,
                          child: Center(
                              child: Icon(
                            Icons.search,
                            color: widget.currentPage == 1
                                ? widget.colors[1]
                                : widget.unselectedColor,
                          )),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NewPostPage()));
                          },
                          child: SizedBox(
                            height: 55,
                            width: 40,
                            child: Center(
                                child: Icon(
                              Icons.add,
                              color: widget.currentPage == 2
                                  ? widget.colors[2]
                                  : widget.unselectedColor,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          width: 40,
                          child: Center(
                              child: Icon(
                            Icons.favorite,
                            color: widget.currentPage == 3
                                ? widget.colors[3]
                                : widget.unselectedColor,
                          )),
                        ),
                        SizedBox(
                          height: 55,
                          width: 40,
                          child: Center(
                              child: Icon(
                            Icons.settings,
                            color: widget.currentPage == 4
                                ? widget.colors[3]
                                : widget.unselectedColor,
                          )),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
      ],
      )
    );
  }
}
