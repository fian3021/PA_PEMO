import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:bantu_bersama/screen/riwayat_donasi_page.dart';
import 'package:bantu_bersama/screen/sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputGalangDanaPage extends StatefulWidget {
  @override
  State<InputGalangDanaPage> createState() => _InputGalangDanaPageState();
}

class _InputGalangDanaPageState extends State<InputGalangDanaPage> {
  final TextEditingController judulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController notelponController = TextEditingController();

  DateTime tanggalGalang = DateTime.now();
  bool isFormValid = false;
  int donasiTerkumpul = 0;

  String username = '';

  void checkFormValidity() {
    final judul = judulController.text;
    final deskripsi = deskripsiController.text;
    final alamat = alamatController.text;
    final noTelpon = notelponController.text;
    setState(() {
      isFormValid = judul.isNotEmpty &&
          deskripsi.isNotEmpty &&
          alamat.isNotEmpty &&
          noTelpon.isNotEmpty;
    });
  }

  @override
  void dispose() {
    judulController.dispose();
    deskripsiController.dispose();
    alamatController.dispose();
    notelponController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    judulController.addListener(_printLatestJudul);
    deskripsiController.addListener(_printLatestDeskripsi);
    alamatController.addListener(_printLatestAlamatPenerima);
    notelponController.addListener(_printLatestNoTelpon);
    getData();
  }

  void _printLatestJudul() {
    print('Judul : ${judulController.text}');
  }

  void _printLatestDeskripsi() {
    print('Deskripsi : ${deskripsiController.text}');
  }

  void _printLatestAlamatPenerima() {
    print('Alamat Penerima : ${alamatController.text}');
  }

  void _printLatestNoTelpon() {
    print('Nomor Telpon : ${notelponController.text}');
  }

  Future<void> getData() async {
    try {
      // Mendapatkan instance user saat ini dari Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      // Memeriksa apakah user telah login
      if (user != null) {
        // Mendapatkan referensi koleksi pengguna di Firestore
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        // Mendapatkan dokumen pengguna berdasarkan ID pengguna saat ini
        DocumentSnapshot userDocument = await users.doc(user.uid).get();

        // Mengekstrak data dari dokumen
        if (userDocument.exists) {
          Map<String, dynamic> userData =
              userDocument.data() as Map<String, dynamic>;

          // Mengakses data pengguna
          String fetchedUsername = userData['username'];

          // Mengupdate state untuk memperbarui tampilan
          setState(() {
            username = fetchedUsername;
          });
        } else {
          print('Dokumen pengguna tidak ditemukan di Firestore.');
        }
      } else {
        print('Belum Login');
      }
    } catch (e) {
      print('Error saat mengambil data pengguna: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var lebar = MediaQuery.of(context).size.width;

    if (user == null) {
      return Center(
        child: AlertDialog(
          content: Text(
            'Silahkan login terlebih dahulu',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ],
        ),
      );
    }

    InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference galang_dana = firestore.collection("galang_dana");

    checkFormValidity();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.all(15),
            width: lebar,
            height: 52,
            child: Text(
              "Form Galang Dana",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan Judul Galang Dana',
                      labelText: 'Judul',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelStyle: inputDecorationTheme.labelStyle,
                      hintStyle: inputDecorationTheme.hintStyle,
                      focusedBorder: inputDecorationTheme.focusedBorder,
                    ),
                    controller: judulController,
                    onChanged: (String value) {
                      print("Judul : $value");
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
                SizedBox(height: 24.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("Data Penerima",
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Masukkan Alamat Penerima",
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
                        SizedBox(height: 16.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Masukkan Nomor Telpon",
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
                    // SizedBox(height: 24.0),
                    // _imageFile != null
                    //     ? Image.file(
                    //         _imageFile!,
                    //         height: 150,
                    //       )
                    //     : Container(
                    //         height: 150,
                    //         color: Colors.grey[300],
                    //         child: Center(
                    //           child: Text('Pilih Gambar'),
                    //         ),
                    //       ),
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
                            galang_dana.add({
                              'judul': judulController.text,
                              'deskripsi': deskripsiController.text,
                              'alamatPenerima': alamatController.text,
                              'nomorTelpon': notelponController.text,
                              'namaPenggalang': username,
                              'tanggalGalangDana': DateTime.now(),
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RiwayatGalangDana(),
                              ),
                            );

                            judulController.text = "";
                            deskripsiController.text = "";
                            alamatController.text = "";
                            notelponController.text = "";

                            final mySnackBar = SnackBar(
                              content: Text(
                                "Penggalangan Dana Berhasil",
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                      'Galang Dana',
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
          ),
        ],
      ),
    );
  }
}
