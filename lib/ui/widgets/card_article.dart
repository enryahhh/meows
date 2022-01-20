part of 'widgets.dart';

class CardArticle extends StatelessWidget {
  const CardArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailArticle()));
      },
      child: Container(
          width: 347,
          height: 263,
          margin: EdgeInsets.only(bottom: 3),
          child: Card(
            semanticContainer: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Column(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/thumb-article.jpg'))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                          height: 45,
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          padding: EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                                  BorderSide(width: 2, color: Color(0xfff8F99EB)),
                            ),
                          ),
                          child: Text(
                              "7 Bau yang tidak disukai kucing,dari buah hingga kotak pasir yang Kotor",
                              style: purpleTextFont)),
                    ),
                    Container(width: 40, child: Icon(Icons.more_vert_rounded))
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      color: Color(0xfffE9EBFB),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      child: Text("Kucing", style: purpleTextFont))
                ],
              )
            ]),
          )),
    );
  }
}
