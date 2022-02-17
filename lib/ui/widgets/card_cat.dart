part of 'widgets.dart';

class CardCat extends StatelessWidget {
  const CardCat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage("assets/images/thumb-article.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nama Kucing",
                                  style: darkPurpleTextFont.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(height: 5),
                              Text("Gender : Jantan"),
                              Text("Umur : 1 thn")
                            ],
                          ))
                    ])),
                    Icon(Icons.arrow_forward_ios)
              ]),
        ),
        // SizedBox(height: 15),
        // Text("${comment.comment}", style: TextStyle(height: 1.5)),
        // SizedBox(height: 20),
        
      ]),
    ));
  }
}