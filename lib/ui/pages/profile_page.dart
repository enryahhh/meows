part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text("Data Diri",
                        textAlign: TextAlign.center,
                        style: darkPurpleTextFont.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 20)),
                  )),
              Container(
                  child: Card(
                      child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/user_pic.png"),
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("username",
                                  style: darkPurpleTextFont.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal)),
                              SizedBox(height: 5),
                              Text("Cat Master",
                                  style: TextStyle(fontSize: 14),
                                  textAlign: TextAlign.left)
                            ],
                          )),
                    ),
                    Icon(Icons.edit),
                  ]),
                ),
              ]))),
              Container(
                  child: Card(
                      child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(child: Text('konten Saya')),
                      SizedBox(height: 10),
                      Container(
                        child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                          Expanded(flex: 2, child: Text("Favorit")),
                          Icon(Icons.arrow_forward_ios_sharp),
                        ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.download),
                          ),
                          Expanded(flex: 2, child: Text("Download")),
                          Icon(Icons.arrow_forward_ios_sharp),
                        ]),
                      )
                    ]),
              ))),
              Container(
                  child: Card(
                      child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(child: Text('lainnya')),
                      SizedBox(height: 10),
                      Container(
                        child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.settings),
                          ),
                          Expanded(flex: 2, child: Text("Pengaturan")),
                          Icon(Icons.arrow_forward_ios_sharp),
                        ]),
                      ),
                      GestureDetector(
                        onTap:(){
                          showAlertDialog(context);
                          print('tes logout');
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.logout),
                            ),
                            Expanded(flex: 2, child: Text("Keluar")),
                            Icon(Icons.arrow_forward_ios_sharp),
                          ]),
                        ),
                      )
                    ]),
              )))
            ])),
      ),
    );
  }
  Future<void> showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Tidak"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Ya"),
      onPressed: () async {
        context.read<AuthBloc>().add(LogoutEvent());
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => SignInPage()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Konfirmasi"),
      content: Text("Anda Yakin Akan Logout?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  
}
