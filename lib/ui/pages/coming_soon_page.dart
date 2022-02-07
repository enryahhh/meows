part of 'pages.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children:[
              Image.asset("assets/images/coming_soon.png"),
              SizedBox(height:10),
              Text("Coming Soon Myaw!"),
              Text('Silahkan Kembali Ke Beranda'),
              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child:Text("Beranda")
              )
            ]
          )
        )
      ),
    );
  }
}