part of 'pages.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<PostBloc>().add(FetchPost(true,true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.menu),
                  // Icon(Icons.notifications),
                  Container(
                      width: 50,
                      height: 50,
                      child: Image.asset("assets/images/logo.png"))
                  // TextButton(child:Text("verify email page"),onPressed:(){
                  //   Navigator.push(context, MaterialPageRoute(builder: (ctx)=>VerifyEmail()));
                  // }),
                ],
              ),
            ),
            // Container(
            //     margin: EdgeInsets.only(top: 23, bottom: 8),
            //     child: Text("Jum'at , 22 Januari 2022")),
            SizedBox(height: 20),
            BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              print(state);
              if (state is UserLoaded) {
                return Text("Hai ${state.user.name}",
                    style: darkPurpleTextFont.copyWith(fontSize: 23));
              } else if (state is UserLoading) {
                return Text("....");
              }
              return Text("Guest",
                  style: darkPurpleTextFont.copyWith(fontSize: 23));
            }),
            // Text("Hai Username",style:darkPurpleTextFont.copyWith(fontSize:23)),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ComingSoonPage()));
              },
              child: Container(
                width: 354,
                height: 306,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                context.read<CatsBloc>().add(GetCat());
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => MyCatPage()));
                              },
                              child: createKotakMenu(
                                  context,
                                  150,
                                  164,
                                  Color(0xFF8ADFF5),
                                  [
                                    Flexible(
                                        child: Image.asset(
                                      "assets/images/pet.png",
                                      height: SizeDevice(context).heightDevice *
                                          0.12,
                                    )),
                                    Text("Kucingku", style: darkPurpleTextFont),
                                  ],
                                  Icon(Icons.arrow_forward)),
                            ),
                            createKotakMenu(
                                context,
                                148,
                                125,
                                Color(0xFFED5F5F),
                                [
                                  Flexible(
                                      child: Image.asset(
                                    "assets/images/paw.png",
                                    height:
                                        SizeDevice(context).heightDevice * 0.09,
                                  )),
                                  Text("Kesehatan", style: whiteTextFont),
                                ],
                                Icon(Icons.arrow_forward, color: Colors.white)),
                          ]),
                      // SizedBox(width: 17,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          createKotakMenu(
                              context,
                              148,
                              125,
                              Color(0xFF024873),
                              [
                                Flexible(
                                    child: Image.asset(
                                  "assets/images/growth.png",
                                  height:
                                      SizeDevice(context).heightDevice * 0.09,
                                )),
                                Flexible(
                                    child: Text("Pertumbuhan ",
                                        style: whiteTextFont)),
                              ],
                              Icon(Icons.arrow_forward, color: Colors.white)),
                          createKotakMenu(
                              context,
                              150,
                              164,
                              mainColor,
                              [
                                Flexible(
                                    child: Image.asset(
                                  "assets/images/pet-bowl.png",
                                  // height: SizeDevice(context).heightDevice * 0.5,
                                )),
                                Flexible(
                                    child: Text("Pakan Kucing ",
                                        style: darkPurpleTextFont)),
                              ],
                              Icon(Icons.arrow_forward, color: Colors.black)),
                        ],
                      )
                    ]),
              ),
            ),
            SizedBox(height: 31),
            Row(
              children: [
                Text("Artikel Terbaru",
                    style: darkPurpleTextFont.copyWith(fontSize: 24)),
              ],
            ),
            SizedBox(height: 10),
            BlocBuilder<PostBloc, PostState>(builder: (context, state) {
              if (state is PostLoadFailure) {
                return NoConnection(
                    cobaLagi: () {
                      context.read<PostBloc>().add(FetchPost(true,true));
                    },
                    pesanError: "Terjadi Kesalahan");
              } else if (state is PostLoaded) {
                return ListView.builder(
                    itemCount: state.post.length,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, i) => CardArticle(post: state.post[i]));
                // List<Widget> tes = state.post.map((e) => CardArticle(post: e)).toList();

                // return ListView(
                //   children:[
                //     ...tes
                //   ]
                // );
              }
              return Center(child: CircularProgressIndicator());
            })
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

  Widget createKotakMenu(BuildContext context, double? width, double? height,
      Color color, List<Widget> isi, Icon iconnya) {
    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        color: color,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: isi),
              iconnya
            ]));
  }
}
