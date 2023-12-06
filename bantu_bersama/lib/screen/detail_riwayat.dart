import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailRiwayatDonasi extends StatelessWidget {
  const DetailRiwayatDonasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
        title: Center(
          child: Text(
            'Detail Donasi',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: ListView(
        children: [
          Image.asset("assets/anak.png"),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Sedekah Makanan Bergizi',
              style: GoogleFonts.kanit(
                textStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Rp 10.612.983',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Terkumpul Dari',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                'Rp 50.000.000',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Status :',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(width: 8.0),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Belum Berakhir',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 730,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(121, 176, 183, 0.837),
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 30.0),
                  child: Text(
                    'Deskripsi :',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                  child: Text(
                    'Dukung aksi kemanusiaan kami! Pemuda Hijrah mengajak Anda bergabung dalam misi memberi makan kucing jalanan. Donasi Anda akan menyediakan makanan dan perawatan kesehatan untuk kucing-kucing yang membutuhkan. Bersama-sama, mari ciptakan perubahan positif untuk hewan-hewan terlantar di sekitar kita. Setiap kontribusi Anda memiliki dampak besar. Ayo berbagi kasih dan kebaikan! 🐾💙 \n\n#PemudaHijrahCare \n#MemberiMakanKucing',
                    style: GoogleFonts.bitter(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 190,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          'Penerima :',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Text(
                          'Panti Kasih IBU',
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          'jl. Juanda, samarinda utara, Kota Samarinda, Kalimantan Timur, Indonesia',
                          style: GoogleFonts.kanit(
                            textStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          children: [
                            Text(
                              'Telepon :',
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '081245672345',
                              style: GoogleFonts.kanit(
                                textStyle: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 85),
                  child: Row(
                    children: [
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FormDonasiPage()));
                          },
                          child: Text(
                            "   Edit  ",
                            style: GoogleFonts.lora(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Provider.of<ThemeModeData>(context).defaultColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => FormDonasiPage()));
                          },
                          child: Text(
                            " Hapus ",
                            style: GoogleFonts.lora(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Provider.of<ThemeModeData>(context).defaultColor,
                          ),
                        ),
                      ),
                    ],
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
