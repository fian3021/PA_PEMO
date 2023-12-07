import 'package:bantu_bersama/model/AUTH.dart';
import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:bantu_bersama/screen/Tema.dart';
import 'package:bantu_bersama/screen/home_page.dart';
import 'package:bantu_bersama/screen/profile_page.dart';
import 'package:bantu_bersama/screen/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class setelan extends StatelessWidget {
  const setelan({super.key});

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
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Nama Akun',
                        style: TextStyle(fontSize: 17),
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
              leading:
                  const Icon(Icons.home, color: Color.fromARGB(153, 0, 0, 0)),
              title: const Text('Beranda',
                  style: TextStyle(color: Color.fromARGB(153, 0, 0, 0))),
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
              leading: const Icon(Icons.account_circle_rounded,
                  color: Color.fromARGB(153, 0, 0, 0)),
              title: const Text('Akun',
                  style: TextStyle(color: Color.fromARGB(153, 0, 0, 0))),
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
              leading: const Icon(Icons.wb_sunny_sharp,
                  color: Color.fromARGB(153, 0, 0, 0)),
              title: const Text('Tema',
                  style: TextStyle(color: Color.fromARGB(153, 0, 0, 0))),
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
              leading:
                  const Icon(Icons.logout, color: Color.fromARGB(153, 0, 0, 0)),
              title: const Text('Keluar',
                  style: TextStyle(color: Color.fromARGB(153, 0, 0, 0))),
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
      // FOOTER
      bottomNavigationBar: Container(
        height: 30,
        color: Provider.of<ThemeModeData>(context).defaultColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Copyright © Kelompok 4 - A2',
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
