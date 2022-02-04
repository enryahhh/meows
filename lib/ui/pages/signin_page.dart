part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController pwCtrl = new TextEditingController();
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      body: isSigningIn
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(top: 70, left: 52, right: 54),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",
                        style: TextStyle(
                          fontSize: 36,
                          color: mainColor,
                        )),
                    SizedBox(height: 40),
                    TextField(
                      controller: emailCtrl,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    SizedBox(height: 32),
                    TextField(
                      controller: pwCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text("Forgot Password"),
                      ),
                    ),
                    SizedBox(height: 32),
                    Container(
                      width: 304,
                      height: 52,
                      margin: EdgeInsets.only(top: 35),
                      child: ElevatedButton(
                        child: Text('Login'),
                        onPressed: () async {
                          setState(() {
                            isSigningIn = true;
                          });

                          SignInSignUpResult result = await AuthServices.signIn(
                              emailCtrl.text, pwCtrl.text);

                          if (result.user == null) {
                            setState(() {
                              isSigningIn = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(milliseconds: 1500),
                              backgroundColor: Color(0xFFFF5C83),
                              content: Text(result.message!),
                            ));
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => HomePage()));
                          }
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
                    SizedBox(height: 55),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: SizeDevice(context).widthDevice * 0.25,
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                            )),
                        Text("Or With", style: TextStyle(fontSize: 12)),
                        Container(
                            width: SizeDevice(context).widthDevice * 0.25,
                            child: Divider(
                              height: 1,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    //   Container(
                    //     width: 42,
                    //     height: 42,
                    //     margin: EdgeInsets.only(right: 16),
                    //     padding: EdgeInsets.all(9),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Color(0xFFE3E8F1)),
                    //         borderRadius: BorderRadius.circular(21)),
                    //     child: Image.asset("assets/images/google.png"),
                    //   ),
                    //   Container(
                    //     width: 42,
                    //     height: 42,
                    //     padding: EdgeInsets.all(9),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Color(0xFFE3E8F1)),
                    //         borderRadius: BorderRadius.circular(21)),
                    //     child: Image.asset("assets/images/fb.png"),
                    //   )
                    // ]),
                    SizedBox(
                      height: 123,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("Doesn't have an account? ", style: purpleTextFont),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignUpPage()));
                          },
                          child: Text(
                            "Register",
                            style: purpleTextFont.copyWith(
                                fontWeight: FontWeight.bold),
                          ))
                    ])
                  ]),
            ),
    );
  }
}
