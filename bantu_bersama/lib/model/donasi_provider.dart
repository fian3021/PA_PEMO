import 'package:flutter/foundation.dart';
import 'donasi.dart';

class DonasiProvider with ChangeNotifier {
  List<Donasi> _hasilDonasi = [];

  List<Donasi> get hasilDonasi => _hasilDonasi;

  void tambahDonasi(Donasi donasi) {
    _hasilDonasi.add(donasi);
    notifyListeners();
  }
}
