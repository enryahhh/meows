part of 'widgets.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Image.asset("assets/images/error.png"),
      SizedBox(height: 20),
      Text("Tidak ada koneksi internet",
          style: darkPurpleTextFont.copyWith(fontSize: 22)),
      Text("Silahkan Cek Koneksi internet dan coba lagi",
          style: darkPurpleTextFont.copyWith(fontSize: 12)),
      SizedBox(height: 20),
      ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(), primary: Color(0xFFF8cdff5)),
          child: Text("Coba Lagi", style: darkPurpleTextFont)),
    ]));
  }
}
