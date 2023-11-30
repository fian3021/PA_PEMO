import 'package:bantu_bersama/screen/detail_donasi.dart';
import 'package:bantu_bersama/screen/form_donasi_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_donasi.dart';
import '../model/data_donasi_provider.dart';
import '../model/theme_mode_data.dart';
import '../widget/drawer.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    final donasiProvider = Provider.of<DataDonasiProvider>(context);
    final donasiList = donasiProvider.donasiList;
    return Scaffold(
      drawer: AppDrawer(),
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
            padding: EdgeInsets.only(top: 15, bottom: 5),
            width: lebar,
            height: 49,
            child: Text(
              "Bantu Bersama Siapa Hari Ini?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),

          //Daftar Donasi
          Column(
            children: donasiList.map((data) {
              return daftarDonasi(data: data);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class daftarDonasi extends StatelessWidget {
  final dataDonasi data;

  daftarDonasi({required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => detaildonasi(),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(5),
        color: Color.fromRGBO(0, 0, 0, 0),
        shadowColor: Color.fromRGBO(0, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(12, 10, 10, 10),
              width: 150,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(4, 87, 98, 0.8),
                    offset: Offset(2, 3),
                    blurRadius: 5,
                  )
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: data.gambar,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.judul,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium),
                SizedBox(height: 3),
                Text('${data.orang}',
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Terkumpul: ',
                        style: Theme.of(context).textTheme.bodySmall),
                    Stack(
                      children: [
                        Align(
                          child: Container(
                            width: 90,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Provider.of<ThemeModeData>(context)
                                  .defaultColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        Align(
                          child: Container(
                            margin: EdgeInsets.only(left: 5, top: 3),
                            width: 80,
                            height: 20,
                            child: Text(
                              'Rp. ${data.donasiTerkumpul}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
