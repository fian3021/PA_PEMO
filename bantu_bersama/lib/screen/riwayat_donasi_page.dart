import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:provider/provider.dart';

import '../widget/drawer.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text(
            'Riwayat',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RiwayatDonasiPage()));
                  },
                  child: Text(
                    "Riwayat Donasi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Patrick Hand',
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(lebar, 50),
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Provider.of<ThemeModeData>(context).defaultColor,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RiwayatGalangDana()));
                  },
                  child: Text(
                    "Riwayat Galang Dana",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Patrick Hand',
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(lebar, 50),
                    foregroundColor: Colors.white,
                    backgroundColor:
                        Provider.of<ThemeModeData>(context).defaultColor,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class RiwayatDonasiPage extends StatelessWidget {
  Card donasiCard(String nama, String jumlahDonasi, String metodePembayaran,
      String keterangan, String id) {
    return Card(
      color: Color.fromRGBO(0, 0, 0, 0),
      shadowColor: Color.fromRGBO(255, 255, 255, 0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(15, 25, 0, 5),
            child: Text(
              nama,
              style: TextStyle(
                // color: Provider.of<ThemeModeData>(context).defaultColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                child: Text('Jumlah Donasi :',
                    style: TextStyle(
                        fontSize: 14,
                        // color: Provider.of<ThemeModeData>(context).defaultColor,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                child: Text('Rp ' + jumlahDonasi,
                    style: TextStyle(
                        fontSize: 14,
                        // color: Provider.of<ThemeModeData>(context).defaultColor,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                child: Text('Metode Pembayaran :',
                    style: TextStyle(
                        fontSize: 14,
                        // color: Provider.of<ThemeModeData>(context).defaultColor,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                child: Text(metodePembayaran,
                    style: TextStyle(
                        fontSize: 14,
                        // color: Provider.of<ThemeModeData>(context).defaultColor,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text('Keterangan :',
                    style: TextStyle(
                        fontSize: 14,
                        // color: Provider.of<ThemeModeData>(context).defaultColor,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 8, 0, 20),
                child: Text(keterangan,
                    style: TextStyle(
                        fontSize: 14,
                        // color: Provider.of<ThemeModeData>(context).defaultColor,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference donasi = firestore.collection("donasi");

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Donasi',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                donasi.orderBy('tanggalDonasi', descending: false).snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? ListView(
                      children: snapshot.data!.docs
                          .map(
                            (e) => donasiCard(
                                e.get('nama'),
                                e.get('jumlahDonasi').toString(),
                                e.get('metodePembayaran'),
                                e.get('keterangan'),
                                // e.get('tanggalDonasi').toString(),
                                e.id),
                          )
                          .toList(),
                    )
                  : Text('Loading...');
            },
          ),
        ),
      ),
    ));
  }
}

class RiwayatGalangDana extends StatefulWidget {
  @override
  State<RiwayatGalangDana> createState() => _RiwayatGalangDanaState();
}

class _RiwayatGalangDanaState extends State<RiwayatGalangDana> {
  Card dataCard(String judul, String deskripsi, String alamat, String noTelp,
      String namaPenggalang, String id) {
    return Card(
      color: Color.fromRGBO(0, 0, 0, 0),
      shadowColor: Color.fromRGBO(255, 255, 255, 0.4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        editData(context, judul, deskripsi, alamat, noTelp, id);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Center(
                  child: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        hapusData(context, id);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 25, 0, 10),
            child: Text(
              judul,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                child: Text('Deskripsi',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 3, 0, 5),
                child: Text(deskripsi,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                child: Text('Alamat :',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 3, 0, 0),
                child: Text(alamat,
                    style: TextStyle(
                        fontSize: 14,
                        // color: Provider.of<ThemeModeData>(context).defaultColor,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text('Telp :',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Text(noTelp,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 20),
                child: Text('Penggalang :',
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.normal)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 0, 20),
                child: Text(namaPenggalang,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  final TextEditingController judulController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController notelponController = TextEditingController();

  Future<dynamic> editData(BuildContext context, String judul, String deskripsi,
      String alamat, String noTelp, String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference galangDana = firestore.collection("galang_dana");

    judulController.text = judul;
    deskripsiController.text = deskripsi;
    alamatController.text = alamat;
    notelponController.text = noTelp;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Data"),
          content: Container(
            width: 300,
            height: 500,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Judul',
                  ),
                  controller: judulController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Deskripsi',
                  ),
                  controller: deskripsiController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Alamat Penerima',
                  ),
                  controller: alamatController,
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'No. Telepon',
                  ),
                  controller: notelponController,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                galangDana.doc(id).update({
                  "judul": judulController.text.toString(),
                  "deskripsi": deskripsiController.text.toString(),
                  "alamatPenerima": deskripsiController.text.toString(),
                  "nomorTelpon": deskripsiController.text.toString(),
                });
                Navigator.of(context).pop();

                final mySnackBar = SnackBar(
                  content: Text(
                    "Edit Berhasil",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  duration: Duration(seconds: 3),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.black12,
                );
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> hapusData(BuildContext context, String id) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference galangDana = firestore.collection("galang_dana");

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Hapus Data"),
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                galangDana.doc(id).delete();
                Navigator.of(context).pop();
                final mySnackBar = SnackBar(
                  content: Text(
                    "Hapus Data Berhasil",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  duration: Duration(seconds: 3),
                  padding: EdgeInsets.all(10),
                  backgroundColor: Colors.black12,
                );
                ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference galangDana = firestore.collection("galang_dana");

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Galang Dana',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: StreamBuilder<QuerySnapshot>(
            stream: galangDana
                .orderBy('tanggalGalangDana', descending: false)
                .snapshots(),
            builder: (_, snapshot) {
              return (snapshot.hasData)
                  ? ListView(
                      children: snapshot.data!.docs
                          .map(
                            (e) => dataCard(
                                e.get('judul'),
                                e.get('deskripsi'),
                                e.get('alamatPenerima'),
                                e.get('nomorTelpon'),
                                e.get('namaPenggalang'),
                                e.id),
                          )
                          .toList(),
                    )
                  : Text('Loading...');
            },
          ),
        ),
      ),
    ));
  }
}
