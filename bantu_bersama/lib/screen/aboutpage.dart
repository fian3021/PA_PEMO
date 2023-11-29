import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:bantu_bersama/screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
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
            // ListTile(
            //   leading: const Icon(Icons.account_circle, color: Colors.white60),
            //   title: const Text('Profil Anda',
            //       style: TextStyle(color: Colors.white60)),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return const ProfilePage();
            //         },
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Tentang BantuBersama',
            style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.all(10),
            width: lebar,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/about.png'),
                fit: BoxFit.cover,
              ),
            ),
          )),
          Container(
            height: 160,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Provider.of<ThemeModeData>(context).defaultColor,
                width: 1,
              ),
              color: Provider.of<ThemeModeData>(context).defaultColor,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Aplikasi BantuBersama",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Berdiri pada tahun 2023, aplikasi BantuBersama diharapkan menjadi jembatan kebaikan untuk membantu sesama. Terima kasih kepada semua orang baik, yang telah berdonasi melalui BantuBersama",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                    textAlign: TextAlign.center,
                  )
                ]),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Provider.of<ThemeModeData>(context).defaultColor,
                width: 1,
              ),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "PROJEK AKHIR MOBILE",
                    style: GoogleFonts.patrickHand(
                        textStyle: TextStyle(
                      color: Provider.of<ThemeModeData>(context).defaultColor,
                      fontSize: 25,
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PROJEK AKHIR \n 2109106022 \n Pem. Piranti Bergerak A1'21",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Provider.of<ThemeModeData>(context)
                                .defaultColor,
                            fontWeight: FontWeight.normal)),
                    textAlign: TextAlign.center,
                  ),
                ]),
          ),
          Container(
            height: 160,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Provider.of<ThemeModeData>(context).defaultColor,
                width: 1,
              ),
              color: Provider.of<ThemeModeData>(context).defaultColor,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Kontak",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "2109106010 Muhammad Fikri\n2109106021 Adlina Safa Sephia Putri\n2109106022 Al Fiana Nur Priyanti\n2109106023 Shafira Octafia",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.normal)),
                    textAlign: TextAlign.center,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
