import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bantu_bersama/model/donasi_provider.dart';
import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:provider/provider.dart';

import '../widget/drawer.dart';

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
    var lebar = MediaQuery.of(context).size.width;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference donasi = firestore.collection("donasi");

    return SafeArea(
        child: Scaffold(
      drawer: AppDrawer(),
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
                  ? Column(
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

// class RiwayatGalangDana extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var lebar = MediaQuery.of(context).size.width;
//     final donasiProvider = Provider.of<DonasiProvider>(context);
//     final hasil = donasiProvider.hasilDonasi;

//     return Scaffold(
//       drawer: AppDrawer(),
//       appBar: AppBar(
//         title: Text(
//           'Riwayat Galang Dana',
//           style: Theme.of(context).textTheme.headlineLarge,
//         ),
//         backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
//       ),
//       body: ListView.builder(
//         itemCount: hasil.length,
//         itemBuilder: (BuildContext context, int index) {
//           final donasi = hasil[index];
//           return Card(
//               color: Color.fromRGBO(0, 0, 0, 0),
//               shadowColor: Color.fromRGBO(255, 255, 255, 0.4),
//               child: Stack(
//                 children: [
//                   Container(
//                     width: lebar,
//                     alignment: Alignment.topRight,
//                     margin: EdgeInsets.only(top: 10, right: 10),
//                     child: Text('${donasi.tanggalDonasi}',
//                         style: Theme.of(context).textTheme.displaySmall),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.fromLTRB(15, 25, 0, 5),
//                         child: Text('${donasi.nama}',
//                             style: Theme.of(context).textTheme.headlineMedium),
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
//                             child: Text('Jumlah Donasi :',
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                           ),
//                           Container(
//                             margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
//                             child: Text('Rp ${donasi.jumlahDonasi}',
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
//                             child: Text('Metode Pembayaran :',
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                           ),
//                           Container(
//                             margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
//                             child: Text('${donasi.metodePembayaran}',
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
//                             child: Text('Keterangan :',
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                           ),
//                           Container(
//                             margin: EdgeInsets.fromLTRB(15, 8, 0, 20),
//                             child: Text('${donasi.keterangan}',
//                                 style: Theme.of(context).textTheme.bodyMedium),
//                           ),
//                         ],
//                       ),
//                     ],
//                   )
//                 ],
//               ));
//         },
//       ),
//     );
//   }
// }
