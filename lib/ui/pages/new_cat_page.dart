part of 'pages.dart';

class NewCatPage extends StatefulWidget {
  const NewCatPage({Key? key}) : super(key: key);

  @override
  _NewCatPageState createState() => _NewCatPageState();
}

class _NewCatPageState extends State<NewCatPage> {
  XFile? photo;
  TextEditingController namaKucingCtrl = TextEditingController();
  TextEditingController rasCtrl = TextEditingController();
  TextEditingController _tglLahirCtrl = TextEditingController();
  String? dropdownValue;
  DateTime? _selectedDate;
  final _inputFormKey = GlobalKey<FormState>();

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _tglLahirCtrl
        ..text = DateFormat.yMMMd().format(_selectedDate!)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _tglLahirCtrl.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            width: 90,
            height: 104,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: (photo == null)
                              ? AssetImage("assets/images/user_pic.png")
                              : FileImage(File(photo!.path)) as ImageProvider,
                          fit: BoxFit.cover)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () async {
                      if (photo == null) {
                        photo = await getImage();
                      } else {
                        photo = null;
                      }

                      setState(() {});
                    },
                    child: Container(
                      height: 28,
                      width: 28,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage((photo == null)
                                  ? "assets/images/btn_add_photo.png"
                                  : "assets/images/btn_del_photo.png"))),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 36,
          ),
          TextFormField(
            controller: namaKucingCtrl,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Nama Kucing",
                hintText: "Nama Kucing"),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: rasCtrl,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Ras",
                hintText: "Ras"),
          ),
          SizedBox(
            height: 16,
          ),
          DropdownButtonFormField<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            validator: (value) => value == null ? "Pilih Jenis Kelamin" : null,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Jenis Kelamin",
                hintText: "Jenis Kelamin"),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: <String>['Jantan', 'Betina']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            focusNode: AlwaysDisabledFocusNode(),
            controller: _tglLahirCtrl,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                labelText: "Tanggal Lahir",
                hintText: "Tanggal Lahir"),
            onTap: () {
              _selectDate(context);
            },
          ),
          // InputDatePickerFormField(firstDate: DateTime(1999), lastDate: DateTime(2022))
          SizedBox(
            height: 16,
          ),
          BlocConsumer<CatsBloc, CatsState>(listener: (context, state) {
            if (state is CatsLoadFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Terjadi kesalahan"),
                duration: Duration(milliseconds: 1500),
                backgroundColor: Color(0xFFFF5C83),
              ));
            } else if (state is CatsCreateSuccess) {
              context.read<CatsBloc>().add(GetCat());
              Navigator.of(context).pop();
            }
          }, builder: (context, state) {
            if (state is CatsLoading) {
              return CircularProgressIndicator();
            }
            return ElevatedButton(
                onPressed: () {
                  // if(!_inputFormKey.currentState!.validate()){

                  // }
                  if (!(namaKucingCtrl.text.trim() != "")) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Nama Kucing Tidak Boleh Kosong"),
                      duration: Duration(milliseconds: 1500),
                      backgroundColor: Color(0xFFFF5C83),
                    ));
                  } else if(dropdownValue == null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Jenis Kelamin harus dipilih"),
                      duration: Duration(milliseconds: 1500),
                      backgroundColor: Color(0xFFFF5C83),
                    ));
                  }else {
                    context.read<CatsBloc>().add(AddCat(
                        namaKucingCtrl.text,
                        dropdownValue!,
                        _tglLahirCtrl.text,
                        !(rasCtrl.text.trim() != "") ? null : rasCtrl.text,
                        photo == null ? null : File(photo!.path)));
                  }
                },
                child: Text("Tambah"));
          })
        ]),
      )
    ]));
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
