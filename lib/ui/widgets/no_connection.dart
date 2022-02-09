part of 'widgets.dart';

class NoConnection extends StatelessWidget {
   final Function cobaLagi;
   final String pesanError;
   NoConnection({Key? key, required this.cobaLagi, required this.pesanError}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Image.asset("assets/images/error.png"),
      SizedBox(height: 20),
      Text("Error",
          style: darkPurpleTextFont.copyWith(fontSize: 22)),
      Text(pesanError,
          style: darkPurpleTextFont.copyWith(fontSize: 12)),
      SizedBox(height: 20),
      ElevatedButton(
          onPressed: () {
            cobaLagi();
          },
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), primary: Color(0xFFF8cdff5)),
          child: Text("Coba Lagi", style: darkPurpleTextFont)),
    ]));
  }
}
