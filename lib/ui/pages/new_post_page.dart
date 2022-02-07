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
        floatingActionButton: ElevatedButton(onPressed: () async {
          await PostServices.newPost(titleCtrl.text,contentCtrl.text);
        }, child: Text('Save')),
        body: SingleChildScrollView(
          child: Container(
            margin:EdgeInsets.symmetric(horizontal:20,vertical:25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Buat Post Baru",style:darkPurpleTextFont.copyWith(fontSize:20)),
                TextField(
                        controller: titleCtrl,
                        decoration: InputDecoration(
                            labelText: 'Judul'),
                      ),
                      SizedBox(height:20),
                      TextField(
                        controller: contentCtrl,
                        keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          minLines: 1,
                          maxLines: 15,
                           decoration: InputDecoration(
                            labelText: 'Deskripsi'),
                        )
                // HtmlEditor(
                //   controller: controller,
                //   htmlEditorOptions: HtmlEditorOptions(
                //     hint: 'Your text here...',
                //     shouldEnsureVisible: true,
                //     //initialText: "<p>text content initial, if any</p>",
                //   ),
                //   htmlToolbarOptions: HtmlToolbarOptions(
                //     defaultToolbarButtons: [
                //      ListButtons(listStyles: false),
                //       InsertButtons(
                //           video: false,
                //           audio: false,
                //           table: false,
                //           hr: false,
                //           otherFile: false)
                //     ],
                //     toolbarPosition: ToolbarPosition.belowEditor, //by default
                //     toolbarType: ToolbarType.nativeScrollable, //by default
                //     onButtonPressed: (ButtonType type, bool? status,
                //         Function()? updateStatus) {
                //       print(
                //           "button '${describeEnum(type)}' pressed, the current selected status is $status");
                //       return true;
                //     },
                //     onDropdownChanged: (DropdownType type, dynamic changed,
                //         Function(dynamic)? updateSelectedItem) {
                //       print(
                //           "dropdown '${describeEnum(type)}' changed to $changed");
                //       return true;
                //     },
                //     mediaLinkInsertInterceptor:
                //         (String url, InsertFileType type) {
                //       print(url);
                //       return true;
                //     },
                //     mediaUploadInterceptor:
                //         (PlatformFile file, InsertFileType type) async {
                //       print(file.name); //filename
                //       print(file.size); //size in bytes
                //       print(file.extension); //file extension (eg jpeg or mp4)
                //       return true;
                //     },
                //   ),
                //   otherOptions: OtherOptions(height: 550),
                //   callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                //     print('html before change is $currentHtml');
                //   }, onChangeContent: (String? changed) {
                //     print('content changed to $changed');
                //   }, onChangeCodeview: (String? changed) {
                //     print('code changed to $changed');
                //   }, onChangeSelection: (EditorSettings settings) {
                //     print('parent element is ${settings.parentElement}');
                //     print('font name is ${settings.fontName}');
                //   }, onDialogShown: () {
                //     print('dialog shown');
                //   }, onEnter: () {
                //     print('enter/return pressed');
                //   }, onFocus: () {
                //     print('editor focused');
                //   }, onBlur: () {
                //     print('editor unfocused');
                //   }, onBlurCodeview: () {
                //     print('codeview either focused or unfocused');
                //   }, onInit: () {
                //     print('init');
                //   },
                //       //this is commented because it overrides the default Summernote handlers
                //       /*onImageLinkInsert: (String? url) {
                //           print(url ?? "unknown url");
                //         },
                //         onImageUpload: (FileUpload file) async {
                //           print(file.name);
                //           print(file.size);
                //           print(file.type);
                //           print(file.base64);
                //         },*/
                //       onImageUploadError: (FileUpload? file, String? base64Str,
                //           UploadError error) {
                //     print(describeEnum(error));
                //     print(base64Str ?? '');
                //     if (file != null) {
                //       print(file.name);
                //       print(file.size);
                //       print(file.type);
                //     }
                //   }, onKeyDown: (int? keyCode) {
                //     print('$keyCode key downed');
                //     print(
                //         'current character count: ${controller.characterCount}');
                //   }, onKeyUp: (int? keyCode) {
                //     print('$keyCode key released');
                //   }, onMouseDown: () {
                //     print('mouse downed');
                //   }, onMouseUp: () {
                //     print('mouse released');
                //   }, onNavigationRequestMobile: (String url) {
                //     print(url);
                //     return NavigationActionPolicy.ALLOW;
                //   }, onPaste: () {
                //     print('pasted into editor');
                //   }, onScroll: () {
                //     print('editor scrolled');
                //   }),
                //   plugins: [
                //     SummernoteAtMention(
                //         getSuggestionsMobile: (String value) {
                //           var mentions = <String>['test1', 'test2', 'test3'];
                //           return mentions
                //               .where((element) => element.contains(value))
                //               .toList();
                //         },
                //         mentionsWeb: ['test1', 'test2', 'test3'],
                //         onSelect: (String value) {
                //           print(value);
                //         }),
                //   ],
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       TextButton(
                //         style: TextButton.styleFrom(
                //             backgroundColor: Colors.blueGrey),
                //         onPressed: () {
                //           controller.undo();
                //         },
                //         child:
                //             Text('Undo', style: TextStyle(color: Colors.white)),
                //       ),
                //       SizedBox(
                //         width: 16,
                //       ),
                //       TextButton(
                //         style: TextButton.styleFrom(
                //             backgroundColor: Colors.blueGrey),
                //         onPressed: () {
                //           controller.clear();
                //         },
                //         child:
                //             Text('Reset', style: TextStyle(color: Colors.white)),
                //       ),
                //       SizedBox(
                //         width: 16,
                //       ),
                //       TextButton(
                //         style: TextButton.styleFrom(
                //             backgroundColor: Theme.of(context).accentColor),
                //         onPressed: () async {
                //           var txt = await controller.getText();
                //           if (txt.contains('src=\"data:')) {
                //             txt =
                //                 '<text removed due to base-64 data, displaying the text could cause the app to crash>';
                //           }
                //           setState(() {
                //             result = txt;
                //           });
                //         },
                //         child: Text(
                //           'Submit',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //       SizedBox(
                //         width: 16,
                //       ),
                //       TextButton(
                //         style: TextButton.styleFrom(
                //             backgroundColor: Theme.of(context).accentColor),
                //         onPressed: () {
                //           controller.redo();
                //         },
                //         child: Text(
                //           'Redo',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
