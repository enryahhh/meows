part of 'pages.dart';

class MyCatPage extends StatelessWidget {
  MyCatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: mainColor,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(16)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=>NewCatPage()));
                },
                child: Icon(Icons.add)),
          ),
          body: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Kucingku",
                      style: darkPurpleTextFont.copyWith(
                          fontSize: 22, fontWeight: FontWeight.normal)),
                ),
                BlocBuilder<CatsBloc, CatsState>(builder: (context, state) {
                  if (state is CatsLoadFailure) {
                    return NoConnection(
                        pesanError: "Terjadi kesalahan",
                        cobaLagi: () {
                          context.read<CatsBloc>().add(GetCat());
                        });
                  }
                  if (state is CatsLoaded) {
                    print(state.cats.length);
                    if (state.cats.length > 0) {
                      return Container(
                        height: SizeDevice(context).heightDevice - 100,
                        child: ListView.builder(
                            itemCount: state.cats.length,
                            itemBuilder: (ctx, i) {
                              return CardCat(cat:state.cats[i]);
                            }),
                      );
                    } else {
                      return Text("Anda belum menambah data kucing");
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                }),
              ]))),
    );
  }
}
