part of 'pages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  List<Widget> tes = [
    Container(
                  width:347,
                  height: 243,
                  margin:EdgeInsets.only(bottom:3),
                  child:Card(
                    elevation: 5,
                    
                  )
                ),
                Container(
                  width:347,
                  height: 243,
                  margin:EdgeInsets.only(bottom:3),
                  child:Card(
                    elevation: 5,
                    
                  )
                ),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    Icon(Icons.menu),
                    Icon(Icons.search),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 23, bottom: 8),
                  child: Text("Jum'at , 10 Desember 2021")),
              Text("Hari ini", style: darkPurpleTextFont.copyWith(fontSize: 26)),
              Container(
                width: 354,
                height:306,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      width: 150,
                      height: 164,
                      color: Color(0xFF8ADFF5),
                    ),
                    Container(
                      width: 148,
                      height: 125,
                      // margin: EdgeInsets.only(top:16),
                      color: Color(0xFFED5F5F),
                    ),
                  ]),
                  // SizedBox(width: 17,),
                  Column(
                    children: [
                      Container( 
                       width: 148,
                      height: 125,
                        margin: EdgeInsets.only(bottom:16),
                        color: Color(0xFF024873),
                      ),
                      Container(
                        width: 150,
                        height: 164,
                        color: mainColor,
                      ),
                    ],
                  )
                ]),
              ),
              SizedBox(height:31),
              Row(
                children: [
                  Text("Artikel Populer", style: darkPurpleTextFont.copyWith(fontSize: 24)),
                ],
              ),
              SizedBox(height:10),
              ...tes,
              Container(
                  width:347,
                  height: 243,
                  margin:EdgeInsets.only(bottom:3),
                  child:Card(
                    elevation: 5,
                    
                  )
                ),
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
      ),
    );
  }
}
