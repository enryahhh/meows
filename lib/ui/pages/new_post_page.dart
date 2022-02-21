part of 'pages.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  String result = '';
  final TextEditingController titleCtrl = new TextEditingController();
  final TextEditingController contentCtrl = new TextEditingController();
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ElevatedButton(
            onPressed: () {
              if (!(titleCtrl.text.trim() != "" &&
                  contentCtrl.text.trim() != "")) {
                return null;
              } else {
                context
                    .read<PostBloc>()
                    .add(CreatePost(titleCtrl.text, contentCtrl.text));
              }
            },
            child: Text('Save')),
        body: SingleChildScrollView(
            child:
                BlocConsumer<PostBloc, PostState>(listener: (context, state) {
          if (state is PostCreateSuccess) {
            context.read<PostBloc>().add(FetchPost(false,false));
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Buat Post Baru",
                    style: darkPurpleTextFont.copyWith(fontSize: 20)),
                TextField(
                  controller: titleCtrl,
                  decoration: InputDecoration(labelText: 'Judul'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: contentCtrl,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 15,
                  decoration: InputDecoration(labelText: 'Deskripsi'),
                )
              ],
            ),
          );
        })),
      ),
    );
  }
}
