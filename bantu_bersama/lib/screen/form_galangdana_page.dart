import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputGalangDanaPage extends StatefulWidget {
  @override
  State<InputGalangDanaPage> createState() => _InputGalangDanaPageState();
}

class _InputGalangDanaPageState extends State<InputGalangDanaPage> {
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tempatPenerimaController =
      TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController notelponController = TextEditingController();
  String radioValue = "";
  DateTime tanggalDonasi = DateTime.now();
  bool isFormValid = false;

  void checkFormValidity() {
    final deskripsi = deskripsiController.text;
    final tempatPenerima = tempatPenerimaController.text;
    final alamat = alamatController.text;
    final noTelpon = notelponController.text;
    setState(() {
      isFormValid = deskripsi.isNotEmpty &&
          tempatPenerima.isNotEmpty &&
          alamat.isNotEmpty &&
          noTelpon.isEmpty &&
          radioValue.isNotEmpty;
    });
  }

  @override
  void dispose() {
    deskripsiController.dispose();
    tempatPenerimaController.dispose();
    alamatController.dispose();
    notelponController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    deskripsiController.addListener(_printLatestDeskripsi);
    tempatPenerimaController.addListener(_printLatestTempatPenerima);
    alamatController.addListener(_printLatestAlamatPenerima);
    notelponController.addListener(_printLatestNoTelpon);
  }

  void _printLatestDeskripsi() {
    print('Deskripsi : ${deskripsiController.text}');
  }

  void _printLatestTempatPenerima() {
    print('Tempat Penerima : Rp ${tempatPenerimaController.text}');
  }

  void _printLatestAlamatPenerima() {
    print('Alamat Penerima : ${alamatController.text}');
  }

  void _printLatestNoTelpon() {
    print('Nomor Telpon : ${notelponController.text}');
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference galangdonasi = firestore.collection("Galang Dana");

    checkFormValidity();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BantuBersama',
                style: Theme.of(context).textTheme.headlineLarge),
            Text('Galang Dana',
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          margin: EdgeInsets.only(top: 5),
          padding: EdgeInsets.all(15),
          width: lebar,
          height: 49,
          child: Text(
            "Form Galang Dana",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),

//Text Field
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Tambahkan Deskripsi',
                    labelText: 'Deskripsi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelStyle: inputDecorationTheme.labelStyle,
                    hintStyle: inputDecorationTheme.hintStyle,
                    focusedBorder: inputDecorationTheme.focusedBorder,
                  ),
                  controller: deskripsiController,
                  onChanged: (String value) {
                    print("Deskripsi : $value");
                    checkFormValidity();
                  },
                  autofocus: true,
                ),
              ),
              SizedBox(height: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text("Isi Data Penerima",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Isi Nama Tempat Penerima",
                            labelText: "Tempat Penerima",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelStyle: inputDecorationTheme.labelStyle,
                            hintStyle: inputDecorationTheme.hintStyle,
                            focusedBorder: inputDecorationTheme.focusedBorder,
                          ),
                          controller: tempatPenerimaController,
                          onChanged: (String value) {
                            print("Tempat Penerima  : $value");
                            checkFormValidity();
                          },
                          autofocus: true,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Isi Nama Alamat Penerima",
                            labelText: "Alamat Penerima",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelStyle: inputDecorationTheme.labelStyle,
                            hintStyle: inputDecorationTheme.hintStyle,
                            focusedBorder: inputDecorationTheme.focusedBorder,
                          ),
                          controller: alamatController,
                          onChanged: (String value) {
                            print("Alamat Penerima  : $value");
                            checkFormValidity();
                          },
                          autofocus: true,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Isi Nomor Telpon",
                            labelText: "Nomor Telpon",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelStyle: inputDecorationTheme.labelStyle,
                            hintStyle: inputDecorationTheme.hintStyle,
                            focusedBorder: inputDecorationTheme.focusedBorder,
                          ),
                          controller: notelponController,
                          onChanged: (String value) {
                            print("Nomor Telpon  : $value");
                            checkFormValidity();
                          },
                          autofocus: true,
                        ),
                      ),
                    ],
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text("Pilih  Nominal",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            radioValue = 'Rp 500.000 - Rp 1000.000';
                          });
                        },
                        leading: Radio(
                          value: 'Rp 500.000 - Rp 1000.000',
                          groupValue: radioValue,
                          onChanged: (String? Value) {
                            setState(() {
                              radioValue = Value!;
                            });
                            checkFormValidity();
                          },
                          activeColor:
                              Provider.of<ThemeModeData>(context).defaultColor,
                          // fillColor: radioTheme.overlayColor,
                        ),
                        title: Text(
                          'Rp 500.000 - Rp 1000.000',
                          style: TextStyle(
                              color: radioValue == 'Rp 500.000 - Rp 1000.000'
                                  ? Provider.of<ThemeModeData>(context)
                                      .defaultColor
                                  : Color.fromRGBO(121, 176, 183, 0.837),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            radioValue = 'Rp 1000.000 - Rp 5000.000';
                          });
                        },
                        leading: Radio(
                          value: 'Rp 1000.000 - Rp 5000.000',
                          groupValue: radioValue,
                          onChanged: (String? Value) {
                            setState(() {
                              radioValue = Value!;
                            });
                            checkFormValidity();
                          },
                          activeColor:
                              Provider.of<ThemeModeData>(context).defaultColor,
                        ),
                        title: Text(
                          'Rp 1000.000 - Rp 5000.000',
                          style: TextStyle(
                              color: radioValue == 'Rp 1000.000 - Rp 5000.000'
                                  ? Provider.of<ThemeModeData>(context)
                                      .defaultColor
                                  : Color.fromRGBO(121, 176, 183, 0.837),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            radioValue = 'Rp 5000.000 - Rp 10.000.000';
                          });
                        },
                        leading: Radio(
                          value: 'Rp 5000.000 - Rp 10.000.000',
                          groupValue: radioValue,
                          onChanged: (String? Value) {
                            setState(() {
                              radioValue = Value!;
                            });
                            checkFormValidity();
                          },
                          activeColor:
                              Provider.of<ThemeModeData>(context).defaultColor,
                        ),
                        title: Text(
                          'Rp 5000.000 - Rp 10.000.000',
                          style: TextStyle(
                              color: radioValue == 'Rp 5000.000 - Rp 10.000.000'
                                  ? Provider.of<ThemeModeData>(context)
                                      .defaultColor
                                  : Color.fromRGBO(121, 176, 183, 0.837),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.fromLTRB(80, 30, 80, 25),
                    width: lebar,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isFormValid
                          ? () {
                              galangdonasi.add({
                                'deskripsi': deskripsiController.text,
                                'tempatPenerima': tempatPenerimaController.text,
                                'alamatPenerima': alamatController.text,
                                'nomorTelpon': notelponController.text,
                                'pilihNominal': radioValue,
                                'tanngalGalangDana': DateTime.now(),
                              });
                              deskripsiController.text = "";
                              tempatPenerimaController.text = "";
                              alamatController.text = "";
                              notelponController.text = "";
                              radioValue = "";
                              final mySnackBar = SnackBar(
                                content: Text(
                                  "Donasi Berhasil",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                duration: Duration(seconds: 3),
                                padding: EdgeInsets.all(10),
                                backgroundColor: Colors.black12,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(mySnackBar);
                            }
                          : () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      "Data Belum Lengkap",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    content: Text(
                                      "Harap mengisi semua kolom sebelum Menggalan Dana ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(lebar, 50),
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Provider.of<ThemeModeData>(context).defaultColor,
                      ),
                      child: Text(
                        'GALANG DANA Sekarang',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Patrick Hand',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
