import 'package:bantu_bersama/model/AUTH.dart';
import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:bantu_bersama/screen/Tema.dart';
import 'package:bantu_bersama/screen/home_page.dart';
import 'package:bantu_bersama/screen/profile_page.dart';
import 'package:bantu_bersama/screen/sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class setelan extends StatefulWidget {
  const setelan({super.key});

  @override
  State<setelan> createState() => _setelanState();
}

class _setelanState extends State<setelan> {
  String username = ''; // Variabel untuk menyimpan username

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

          // Mengupdate state untuk memperbarui tampilan
          setState(() {
            username = fetchedUsername;
          });
        } else {
          print('Dokumen pengguna tidak ditemukan di Firestore.');
        }
      } else {
        // Jika pengguna belum login, tetapkan nilai default "Anonymous"
        setState(() {
          username = 'Anonymous';
        });
      }
    } catch (e) {
      print('Error saat mengambil data pengguna: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
        title: Center(
          child: Text(
            'Setelan',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/profil.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        username,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              leading: IconTheme(
                  data: Theme.of(context).iconTheme, child: Icon(Icons.home)),
              title: Text('Beranda',
                  style: Theme.of(context).textTheme.headlineMedium),
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              leading: IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: Icon(Icons.account_circle_rounded)),
              title: Text('Akun',
                  style: Theme.of(context).textTheme.headlineMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProfilePage(); // ganti aj nnti ini
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              leading: IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: Icon(Icons.wb_sunny_sharp)),
              title: Text('Tema',
                  style: Theme.of(context).textTheme.headlineMedium),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Tema();
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              leading: IconTheme(
                  data: Theme.of(context).iconTheme, child: Icon(Icons.logout)),
              title: Text('Keluar',
                  style: Theme.of(context).textTheme.headlineMedium),
              onTap: () async {
                // Call the signOut method from your AuthService
                await AuthService().signOut();

                // Navigate back to the login or home screen (depending on your app flow)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
            ),
          ),
        ],
      ),

      //FOOTER
      bottomNavigationBar: Container(
        height: 30,
        color: Provider.of<ThemeModeData>(context).defaultColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Copyright © Pemrograman Mobile - K4 A2-21',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
