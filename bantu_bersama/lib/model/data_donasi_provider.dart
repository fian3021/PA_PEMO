import 'package:flutter/material.dart';
import 'data_donasi.dart';

class DataDonasiProvider extends ChangeNotifier {
  final List<dataDonasi> _donasiList = [
    dataDonasi(
      judul: "Peduli Hewan Sekitar, Beri \nMakan Kucing Jalanan",
      orang: "20 orang berdonasi",
      donasiTerkumpul: 1500000,
      gambar: AssetImage('assets/kucing.png'),
    ),
    dataDonasi(
      judul: "Bantu Anak-Anak Pesisir \nDapatkan Akses Pendidikan!",
      orang: "50 orang berdonasi",
      donasiTerkumpul: 2200000,
      gambar: AssetImage('assets/anak pesisir.png'),
    ),
    dataDonasi(
      judul: "Ratusan Lansia Dhuafa Darurat \nPengobatan di Rumah",
      orang: "3.615 orang berdonasi",
      donasiTerkumpul: 74779000,
      gambar: AssetImage('assets/lansia.png'),
    ),
    dataDonasi(
      judul: "Sedekah Makanan Bergizi \nUntuk Adik Yatim Dhuafa",
      orang: "40 orang berdonasi",
      donasiTerkumpul: 400000,
      gambar: AssetImage('assets/panti.png'),
    ),
    dataDonasi(
      judul: "Sedekah Makan Untuk Santri \nAhlul Quran Pelosok",
      orang: "20 orang berdonasi",
      donasiTerkumpul: 247000,
      gambar: AssetImage('assets/santri.png'),
    ),
    dataDonasi(
      judul: "Sedekah Jariyah Ambulans \nTolong Warga Palestina",
      orang: "18 orang berdonasi",
      donasiTerkumpul: 288354,
      gambar: AssetImage('assets/ambulans.png'),
    ),
    dataDonasi(
      judul: "DARURAT! Bantu Operasi \n10 Anak Bibir Sumbing",
      orang: "4.851 orang berdonasi",
      donasiTerkumpul: 97857113,
      gambar: AssetImage('assets/anak.png'),
    ),
    dataDonasi(
      judul: "KRISIS AIR! Bantu Warga \nDesa Dhuafa Kekeringan",
      orang: "16 orang berdonasi",
      donasiTerkumpul: 138000,
      gambar: AssetImage('assets/air.png'),
    ),
  ];

  List<dataDonasi> get donasiList => _donasiList;
}
