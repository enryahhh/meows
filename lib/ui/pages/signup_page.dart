part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget signUpSocmed() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 42,
        height: 42,
        margin: EdgeInsets.only(right: 16),
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE3E8F1)),
            borderRadius: BorderRadius.circular(21)),
        child: Image.asset("assets/images/google.png"),
      ),
      Container(
        width: 42,
        height: 42,
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFE3E8F1)),
            borderRadius: BorderRadius.circular(21)),
        child: Image.asset("assets/images/fb.png"),
      )
    ]);
  }

  void notif(String? pesan, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(milliseconds: 1500),
      backgroundColor: Color(0xFFFF5C83),
      content: Text(pesan!),
    ));
  }

  TextEditingController usernameCtrl = new TextEditingController();
  TextEditingController emailCtrl = new TextEditingController();
  TextEditingController pwCtrl = new TextEditingController();
  TextEditingController cpwCtrl = new TextEditingController();
  bool obsPw = true;
  bool obscpw = true;
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: !isSigningUp
            ? Container(
                margin: EdgeInsets.only(top: 70, left: 52, right: 54),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sign Up",
                          style: TextStyle(
                            fontSize: 36,
                            color: mainColor,
                          )),
                      SizedBox(height: 40),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.account_circle_outlined)),
                          controller: usernameCtrl),
                      SizedBox(height: 32),
                      TextField(
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email_outlined)),
                          controller: emailCtrl),
                      SizedBox(height: 32),
                      TextField(
                        obscureText: obsPw,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obsPw = !obsPw;
                                  });
                                },
                                icon: obsPw
                                    ? Icon(Icons.remove_red_eye_outlined)
                                    : Icon(Icons.remove_red_eye_rounded))),
                        controller: pwCtrl,
                      ),
                      SizedBox(height: 32),
                      TextField(
                        obscureText: obscpw,
                        decoration: InputDecoration(
                            labelText: 'Password Confirmation',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscpw = !obscpw;
                                  });
                                },
                                icon: obscpw
                                    ? Icon(Icons.remove_red_eye_outlined)
                                    : Icon(Icons.remove_red_eye_rounded))),
                        controller: cpwCtrl,
                      ),
                      Container(
                        width: 304,
                        height: 52,
                        margin: EdgeInsets.only(top: 35),
                        child: ElevatedButton(
                          child: Text('Create'),
                          onPressed: () async {
                            setState(() {
                              isSigningUp = true;
                            });
                            if (!(usernameCtrl.text.trim() != "" &&
                                emailCtrl.text.trim() != "" &&
                                pwCtrl.text.trim() != "" &&
                                cpwCtrl.text.trim() != "")) {
                              notif("Please fill all the field", context);
                              print("Please fill all the field");
                            } else if (cpwCtrl.text != pwCtrl.text) {
                              notif(
                                  "Mistmatch Password and confirmation password",
                                  context);
                            } else if (pwCtrl.text.length < 6) {
                              notif("Password length min 6 character", context);
                            } else if (!EmailValidator.validate(
                                emailCtrl.text)) {
                              notif("Wrong format email", context);
                            } else {
                              SignInSignUpResult result =
                                  await AuthServices.signUp(emailCtrl.text,
                                      pwCtrl.text, usernameCtrl.text);
                              if (result.user == null) {
                                setState(() {
                                  isSigningUp = false;
                                });

                                notif(result.message, context);
                              }else{
                                Navigator.pushReplacement(context, MaterialPageRoute(builder:(ctx)=> HomePage()));
                              } 

                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(mainColor),
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //         width: SizeDevice(context).widthDevice * 0.25,
                      //         child: Divider(
                      //           height: 1,
                      //           color: Colors.black,
                      //         )),
                      //     Text("Or With", style: TextStyle(fontSize: 12)),
                      //     Container(
                      //         width: SizeDevice(context).widthDevice * 0.25,
                      //         child: Divider(
                      //           height: 1,
                      //           color: Colors.black,
                      //         )),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 23,
                      // ),
                      // signUpSocmed(),
                      Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Have any account? ",
                                    style: purpleTextFont),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SignInPage()));
                                    },
                                    child: Text(
                                      "Login",
                                      style: purpleTextFont.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ))
                              ]))
                    ]),
              )
            : Center(child:CircularProgressIndicator()),
      ),
    );
  }
}
