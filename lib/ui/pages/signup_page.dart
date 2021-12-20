part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 90, left: 52, right: 54),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Sign Up",
              style: TextStyle(
                fontSize: 36,
                color: mainColor,
              )),
          SizedBox(height: 60),
          TextField(
            decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.account_circle_outlined)),
          ),
          SizedBox(height: 32),
          TextField(
            decoration: InputDecoration(
                labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
          ),
          SizedBox(height: 32),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password', prefixIcon: Icon(Icons.lock_outline)),
          ),
          SizedBox(height: 32),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password Confirmation',
                prefixIcon: Icon(Icons.lock_outline)),
          ),
          Container(
            width: 304,
            height: 52,
            margin: EdgeInsets.only(top: 35),
            child: ElevatedButton(
              child: Text('Create'),
              onPressed: () {},
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
          SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: SizeDevice(context).widthDevice * 0.25,
                  child: Divider(
                    height: 1,
                    color: Colors.black,
                  )),
                Text("Or With",style:TextStyle(
                  fontSize:12
                )),
                Container(
                  width: SizeDevice(context).widthDevice * 0.25,
                  child: Divider(
                    height: 1,
                    color: Colors.black,
                  )),
            ],
          )
        ]),
      ),
    );
  }
}
