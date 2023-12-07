import 'package:bantu_bersama/model/galang_dana.dart';
import 'package:flutter/material.dart';

class GalangDanaProvider with ChangeNotifier {
  List<GalangDana> _hasilGalangDana = [];

  List<GalangDana> get hasilGalangDana => _hasilGalangDana;

  void tambahDonasi(GalangDana galangDana) {
    _hasilGalangDana.add(galangDana);
    notifyListeners();
  }
} 