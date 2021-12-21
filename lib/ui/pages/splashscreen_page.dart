part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(top: 73),
                height: 308,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/tes.png')))),

            Text('MEOWS CO',
                style: TextStyle(
                  fontSize: 60,
                )),
            SizedBox(height: 24),
            Text('Your Bests Cat Companion',
                style: TextStyle(
                  fontSize: 22,
                )),
            Container(
              width: 330.75,
              height: 52,
              margin: EdgeInsets.only(top: 35),
              child: ElevatedButton(
                child: Text('Login'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SignInPage()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(mainColor),
                  elevation: MaterialStateProperty.all(0),
                  textStyle: MaterialStateProperty.all(TextStyle(
                    fontSize: 16,
                  )),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SignUpPage()));
              },
              child: Text('Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: mainColor
                  )),
            ),
            // Image.asset('assets/images/tes.png')
          ],
        ),
      ),
    );
  }
}
