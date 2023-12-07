import 'package:bantu_bersama/screen/riwayat_donasi_page.dart';
import 'package:bantu_bersama/screen/setelan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_mode_data.dart';
import '../screen/about_page.dart';
import '../screen/faq_page.dart';
import '../screen/home_page.dart';
import '../screen/profile_page.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String username = ''; // Variabel untuk menyimpan username
  String email = ''; // Variabel untuk menyimpan username

  @override
  void initState() {
    super.initState();
    getData();
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
          String fetchedEmail = userData['email'];

          // Mengupdate state untuk memperbarui tampilan
          setState(() {
            username = fetchedUsername;
            email = fetchedEmail;
          });
        } else {
          print('Dokumen pengguna tidak ditemukan di Firestore.');
        }
      } else {
        // Jika pengguna belum login, tetapkan nilai default "Anonymous"
        setState(() {
          username = 'Anonymous';
          email = 'No Email';
        });
      }
    } catch (e) {
      print('Error saat mengambil data pengguna: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black38),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profil.jpg')),
              accountName: Text(
                username,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              accountEmail: Text(email)),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white60),
            title:
                const Text('Beranda', style: TextStyle(color: Colors.white60)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite, color: Colors.white60),
            title: const Text('Galang Dana',
                style: TextStyle(color: Colors.white60)),
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return const AboutPage();
              //     },
              //   ),
              // );
            },
          ),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.white60),
            title: const Text('Riwayat Donasi',
                style: TextStyle(color: Colors.white60)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RiwayatDonasiPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.white60),
            title: const Text('Akun', style: TextStyle(color: Colors.white60)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white60),
            title:
                const Text('Setelan', style: TextStyle(color: Colors.white60)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const setelan();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading:
                const Icon(Icons.info_outline_rounded, color: Colors.white60),
            title:
                const Text('Tentang', style: TextStyle(color: Colors.white60)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AboutPage();
                  },
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.white60),
            title: const Text('FAQ', style: TextStyle(color: Colors.white60)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FAQPage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
