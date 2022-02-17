part of 'pages.dart';

class MyCatPage extends StatelessWidget {
  const MyCatPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16)),
              onPressed: () {
               
              },
              child: Icon(Icons.add)),
        ),
        body: SingleChildScrollView(
          child:Container(
            padding:EdgeInsets.only(top:10),
            child:Column(
              children:[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Text("Kucingku",style: darkPurpleTextFont.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.normal)),
                ),
                CardCat(),
                CardCat()
              ]
            )
          )
        )
      ),
    );
  }
}