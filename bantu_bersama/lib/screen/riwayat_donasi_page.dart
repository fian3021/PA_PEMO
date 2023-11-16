import 'package:flutter/material.dart';
import 'package:bantu_bersama/model/donasi_provider.dart';
import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:provider/provider.dart';

class RiwayatDonasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    final donasiProvider = Provider.of<DonasiProvider>(context);
    final hasil = donasiProvider.hasilDonasi;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Donasi Anda',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: ListView.builder(
        itemCount: hasil.length,
        itemBuilder: (BuildContext context, int index) {
          final donasi = hasil[index];
          return Card(
              color: Color.fromRGBO(0, 0, 0, 0),
              shadowColor: Color.fromRGBO(255, 255, 255, 0.4),
              child: Stack(
                children: [
                  Container(
                    width: lebar,
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 10, right: 10),
                    child: Text('${donasi.tanggalDonasi}',
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 25, 0, 5),
                        child: Text('${donasi.nama}',
                            style: Theme.of(context).textTheme.headlineMedium),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 5, 0, 5),
                            child: Text('Jumlah Donasi :',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 5),
                            child: Text('Rp ${donasi.jumlahDonasi}',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                            child: Text('Metode Pembayaran :',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Text('${donasi.metodePembayaran}',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: Text('Keterangan :',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 8, 0, 20),
                            child: Text('${donasi.keterangan}',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ));
        },
      ),

      //FOOTER NAMA & NIM
      bottomNavigationBar: Container(
        height: 30,
        color: Provider.of<ThemeModeData>(context).defaultColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Copyright © Al Fiana Nur Priyanti - 2109106022',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}
