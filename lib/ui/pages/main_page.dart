part of 'pages.dart';

class MainPage extends StatelessWidget {
  final List<Widget> tes;
  const MainPage({Key? key, required this.tes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(24),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon(Icons.menu),
                  Icon(Icons.notifications)
                ],
              ),
            ),
            // Container(
            //     margin: EdgeInsets.only(top: 23, bottom: 8),
            //     child: Text("Jum'at , 22 Januari 2022")),
            SizedBox(height: 20),
            BlocBuilder<UserBloc,UserState>(builder: (context,state){
              print(state);
              if(state is UserLoaded){
                return Text("Hai ${state.user.name}",style:darkPurpleTextFont.copyWith(fontSize:23));
              }else if(state is UserLoading){
                return Text("....");
              }
              return Text("Guest",style:darkPurpleTextFont.copyWith(fontSize:23));
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
                            createKotakMenu(
                                context, 150, 164, Color(0xFF8ADFF5), [
                              Flexible(
                                  child: Image.asset(
                                "assets/images/pet.png",
                                height: SizeDevice(context).heightDevice * 0.12,
                              )),
                              Text("Kucingku", style: darkPurpleTextFont),
                              Text("4")
                            ],Icon(Icons.arrow_forward)),
                            createKotakMenu(
                                context, 148, 125, Color(0xFFED5F5F), [
                              Flexible(
                                  child: Image.asset(
                                "assets/images/paw.png",
                                height: SizeDevice(context).heightDevice * 0.09,
                              )),
                              Text("Kesehatan", style: whiteTextFont),
                            ],Icon(Icons.arrow_forward,color:Colors.white)),
                          ]),
                      // SizedBox(width: 17,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          createKotakMenu(
                                context, 148, 125, Color(0xFF024873), [
                              Flexible(
                                  child: Image.asset(
                                "assets/images/growth.png",
                                height: SizeDevice(context).heightDevice * 0.09,
                              )),
                              Flexible(child: Text("Pertumbuhan ", style: whiteTextFont)),
                            ],Icon(Icons.arrow_forward,color:Colors.white)),
                            createKotakMenu(
                                context, 150, 164, mainColor, [
                              Flexible(
                                  child: Image.asset(
                                "assets/images/pet-bowl.png",
                                // height: SizeDevice(context).heightDevice * 0.5,
                              )),
                              Flexible(child: Text("Pakan Kucing ", style: darkPurpleTextFont)),
                            ],Icon(Icons.arrow_forward,color:Colors.black)),
                        ],
                      )
                    ]),
              ),
            ),
            SizedBox(height: 31),
            Row(
              children: [
                Text("Artikel Populer",
                    style: darkPurpleTextFont.copyWith(fontSize: 24)),
              ],
            ),
            SizedBox(height: 10),

            ...tes,

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
      Color color, List<Widget> isi,Icon iconnya) {
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
