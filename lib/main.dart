import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:meows_co/data/services/services.dart';
import 'package:provider/provider.dart';
import 'bussines_logic/blocs/blocs.dart';
import 'ui/pages/pages.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('id_ID', null).then((_) {
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return runApp(MyApp());
  });
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (_)=> new AuthBloc()..add(AppStart())),
        BlocProvider(create: (context)=> UserBloc(authBloc: context.read<AuthBloc>())),
        BlocProvider(create: (_)=> PostBloc()),
        BlocProvider(create: (_)=> CommentBloc()),
      ],
      child: MaterialApp(
        title: 'Meows Co',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocConsumer<AuthBloc, AuthState>(
          listener:(context,state){
            if(state is Authenticated){
              context.read<UserBloc>().add(GetUserPref());
              context.read<PostBloc>().add(FetchPost(true));
            }
          },
          builder: (context,state){
            print(state);
          if(state is Authenticated){
            return HomePage();
          }else if(state is Unauthenticated){
            return SplashPage();
          }
          return Scaffold(body:Center(child:CircularProgressIndicator()));
        }),
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
