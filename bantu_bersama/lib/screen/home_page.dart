import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_mode_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black38),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('assets/profil.jpg')),
                accountName: Text(
                  "Manusia",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                accountEmail: Text("manusia@gmail.com")),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white60),
              title: const Text('Beranda',
                  style: TextStyle(color: Colors.white60)),
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
              leading:
                  const Icon(Icons.info_outline_rounded, color: Colors.white60),
              title: const Text('Tentang BantuBersama',
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
              leading: const Icon(Icons.account_circle, color: Colors.white60),
              title: const Text('Profil Anda',
                  style: TextStyle(color: Colors.white60)),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return const ProfilePage();
                //     },
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
          child: Text('BantuBersama',
              style: Theme.of(context).textTheme.headlineLarge),
        ),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
    );
  }
}
