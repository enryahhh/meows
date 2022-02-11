part of 'pages.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children : [
              Text("Verifikasi Email",style:darkPurpleTextFont.copyWith(fontSize:25)),
              SizedBox(height:20),
              Image.asset("assets/images/mailbox.png"),
              Text("Kami Telah Mengirimkan Email Verifikasi, silahkan verifikasi email anda",style:darkPurpleTextFont,textAlign:TextAlign.center),
              Text("Anda tidak mendapatkan email verifikasi ? ",style:darkPurpleTextFont),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  TextButton(child:Text("Kirim Ulang"),onPressed:(){}),
                  TextButton(child:Text("Ganti Email"),onPressed:(){}),
                ]
              ),
              ElevatedButton(child:Text("Lewati Dahulu"),onPressed:(){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
              }),
            ]
          ),
        )
      )
    );
  }
}