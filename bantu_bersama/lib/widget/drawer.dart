import 'package:bantu_bersama/screen/riwayat_donasi_page.dart';
import 'package:bantu_bersama/screen/setelan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_mode_data.dart';
import '../screen/faq_page.dart';
import '../screen/home_page.dart';
import '../screen/profile_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black38),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/profil.jpg')),
              accountName: Text(
                user?.displayName ?? 'Anonymous',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              accountEmail: Text(user?.email ?? 'No email')),
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
