import 'package:bantu_bersama/screen/riwayat_donasi_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/donasi.dart';
import '../model/donasi_provider.dart';
import '../model/theme_mode_data.dart';

class FormDonasiPage extends StatefulWidget {
  @override
  State<FormDonasiPage> createState() => _FormDonasiPageState();
}

class _FormDonasiPageState extends State<FormDonasiPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jumlahDonasiController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();

  String radioValue = "";
  DateTime tanggalDonasi = DateTime.now();
  bool isFormValid = false;

  void checkFormValidity() {
    final nama = namaController.text;
    final jumlahDonasi = jumlahDonasiController.text;
    final keterangan = keteranganController.text;

    setState(() {
      isFormValid = nama.isNotEmpty &&
          jumlahDonasi.isNotEmpty &&
          keterangan.isNotEmpty &&
          radioValue.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;

    checkFormValidity();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BantuBersama',
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(15),
            width: lebar,
            height: 49,
            child: Text(
              "Form Donasi",
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
                      hintText: 'Masukkan Nama Anda',
                      labelText: 'Nama Anda',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelStyle: inputDecorationTheme.labelStyle,
                      hintStyle: inputDecorationTheme.hintStyle,
                      focusedBorder: inputDecorationTheme.focusedBorder,
                    ),
                    controller: namaController,
                    onChanged: (String value) {
                      print("Nama : $value");
                      checkFormValidity();
                    },
                    autofocus: true,
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixText: "Rp ",
                      hintText: 'Masukkan Jumlah Donasi',
                      labelText: 'Jumlah Donasi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelStyle: inputDecorationTheme.labelStyle,
                      hintStyle: inputDecorationTheme.hintStyle,
                      focusedBorder: inputDecorationTheme.focusedBorder,
                    ),
                    keyboardType: TextInputType.number,
                    controller: jumlahDonasiController,
                    onChanged: (String value) {
                      print("Jumlah Donasi : $value");
                      checkFormValidity();
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Keterangan Donasi',
                      labelText: 'Keterangan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelStyle: inputDecorationTheme.labelStyle,
                      hintStyle: inputDecorationTheme.hintStyle,
                      focusedBorder: inputDecorationTheme.focusedBorder,
                    ),
                    keyboardType: TextInputType.text,
                    controller: keteranganController,
                    onChanged: (String value) {
                      print("Keterangan : $value");
                      checkFormValidity();
                    },
                  ),
                ),
                SizedBox(height: 24.0),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text("Pilih Metode Pembayaran",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    radioValue = 'Dana';
                  });
                },
                leading: Radio(
                  value: 'Dana',
                  groupValue: radioValue,
                  onChanged: (String? Value) {
                    setState(() {
                      radioValue = Value!;
                    });
                    checkFormValidity();
                  },
                  activeColor: Provider.of<ThemeModeData>(context).defaultColor,
                  // fillColor: radioTheme.overlayColor,
                ),
                title: Text(
                  'Dana',
                  style: TextStyle(
                      color: radioValue == 'Dana'
                          ? Provider.of<ThemeModeData>(context).defaultColor
                          : Color.fromRGBO(121, 176, 183, 0.837),
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    radioValue = 'QRIS';
                  });
                },
                leading: Radio(
                  value: 'QRIS',
                  groupValue: radioValue,
                  onChanged: (String? Value) {
                    setState(() {
                      radioValue = Value!;
                    });
                    checkFormValidity();
                  },
                  activeColor: Provider.of<ThemeModeData>(context).defaultColor,
                ),
                title: Text(
                  'QRIS',
                  style: TextStyle(
                      color: radioValue == 'QRIS'
                          ? Provider.of<ThemeModeData>(context).defaultColor
                          : Color.fromRGBO(121, 176, 183, 0.837),
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    radioValue = 'Transfer Bank BRI';
                  });
                },
                leading: Radio(
                  value: 'Transfer Bank BRI',
                  groupValue: radioValue,
                  onChanged: (String? Value) {
                    setState(() {
                      radioValue = Value!;
                    });
                    checkFormValidity();
                  },
                  activeColor: Provider.of<ThemeModeData>(context).defaultColor,
                ),
                title: Text(
                  'Transfer Bank BRI',
                  style: TextStyle(
                      color: radioValue == 'Transfer Bank BRI'
                          ? Provider.of<ThemeModeData>(context).defaultColor
                          : Color.fromRGBO(121, 176, 183, 0.837),
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    radioValue = 'Transfer Bank Mandiri';
                  });
                },
                leading: Radio(
                  value: 'Transfer Bank Mandiri',
                  groupValue: radioValue,
                  onChanged: (String? Value) {
                    setState(() {
                      radioValue = Value!;
                    });
                    checkFormValidity();
                  },
                  activeColor: Provider.of<ThemeModeData>(context).defaultColor,
                ),
                title: Text(
                  'Transfer Bank Mandiri',
                  style: TextStyle(
                      color: radioValue == 'Transfer Bank Mandiri'
                          ? Provider.of<ThemeModeData>(context).defaultColor
                          : Color.fromRGBO(121, 176, 183, 0.837),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          //BUTTON 'DONASI SEKARANG'
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.fromLTRB(80, 30, 80, 25),
            width: lebar,
            height: 50,
            child: ElevatedButton(
              onPressed: isFormValid
                  ? () {
                      String nama = namaController.text;
                      int jumlahDonasi =
                          int.tryParse(jumlahDonasiController.text) ?? 0;
                      String keterangan = keteranganController.text;
                      String metodePembayaran = radioValue;
                      DateTime tanggalDonasi = DateTime.now();

                      final donasiProvider =
                          Provider.of<DonasiProvider>(context, listen: false);

                      Donasi hasilDonasi = Donasi(
                        nama: nama,
                        jumlahDonasi: jumlahDonasi,
                        keterangan: keterangan,
                        metodePembayaran: metodePembayaran,
                        tanggalDonasi: tanggalDonasi,
                      );

                      donasiProvider.tambahDonasi(hasilDonasi);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RiwayatDonasiPage(),
                        ),
                      );

                      //membuat textfield kosong lagi
                      namaController.text = "";
                      keteranganController.text = "";
                      jumlahDonasiController.text = "";
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
                      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                    }
                  : () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Data Belum Lengkap",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            content: Text(
                              "Harap mengisi semua kolom sebelum berdonasi ",
                              style: Theme.of(context).textTheme.bodyMedium,
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
                'Donasi Sekarang',
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
    );
  }
}
