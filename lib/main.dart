import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meows_co/data/services/services.dart';
import 'package:provider/provider.dart';
import 'bussines_logic/blocs/blocs.dart';
import 'ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
        providers:[
          BlocProvider(create: (_)=> UserBloc())
        ],
        child: MaterialApp(
          title: 'Meows Co',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashPage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: ElevatedButton(
            child: Text("Splash Page"),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SplashPage()));
            },
          ),
        ));
  }
}
