part of 'widgets.dart';

class CardComment extends StatelessWidget {
  final Comments comment;
  const CardComment({Key? key, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final DateFormat format = new DateFormat("yyyy-MM-dd hh:mm a");
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/user_pic.png"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${comment.userc.name}",
                              style: darkPurpleTextFont.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                          SizedBox(height: 5),
                          Text(
                              timeago.format(DateTime.parse(comment.createdAt),
                                  locale: 'id'),
                              style: TextStyle(fontSize: 11),
                              textAlign: TextAlign.left)
                        ],
                      ))
                ]))
          ]),
        ),
        SizedBox(height: 15),
        Text("${comment.comment}", style: TextStyle(height: 1.5)),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () => {},
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_circle_up_outlined, size: 18, color: Colors.black),
                      Padding(
                        padding:
                            const EdgeInsets
                                    .only(
                                left: 8.0,
                                right: 8.0),
                        child: Text(
                          '0',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight:
                                  FontWeight
                                      .bold,
                              color: Colors
                                  .black),
                        ),
                      ),
                      Icon(Icons.arrow_circle_down_outlined, size: 18, color: Colors.black),
                      Padding(
                        padding:
                            const EdgeInsets
                                    .only(
                                left: 8.0),
                        child: Text(
                          '0',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight:
                                  FontWeight
                                      .bold,
                              color: Colors
                                  .black),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        )
      ]),
    ));
  }
}
