import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:bantu_bersama/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tema extends StatelessWidget {
  const Tema({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
        title: Center(
          child: Text(
            'Tema',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: lebar,
            margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: Text(
              "Tema Aplikasi",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: Text('Tema Gelap'),
                leading: Radio(
                  value: ThemeMode.dark,
                  activeColor: Provider.of<ThemeModeData>(context).defaultColor,
                  groupValue: Provider.of<ThemeModeData>(context).themeMode,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      Provider.of<ThemeModeData>(context, listen: false)
                          .changeTheme(value);
                    }
                  },
                ),
              ),
              ListTile(
                title: Text('Tema Terang'),
                leading: Radio(
                  value: ThemeMode.light,
                  activeColor: Provider.of<ThemeModeData>(context).defaultColor,
                  groupValue: Provider.of<ThemeModeData>(context).themeMode,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      Provider.of<ThemeModeData>(context, listen: false)
                          .changeTheme(value);
                    }
                  },
                ),
              ),
              ListTile(
                title: Text('Tema Sistem'),
                leading: Radio(
                  value: ThemeMode.system,
                  activeColor: Provider.of<ThemeModeData>(context).defaultColor,
                  groupValue: Provider.of<ThemeModeData>(context).themeMode,
                  onChanged: (ThemeMode? value) {
                    if (value != null) {
                      Provider.of<ThemeModeData>(context, listen: false)
                          .changeTheme(value);
                    }
                  },
                ),
              ),
            ],
          ),
          Container(
            width: lebar,
            margin: EdgeInsets.fromLTRB(20, 20, 0, 10),
            child: Text(
              "Tema Warna",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: Text('Default'),
                onTap: () {
                  Provider.of<ThemeModeData>(context, listen: false).setTheme(
                    Color.fromRGBO(4, 87, 98, 1),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Warna 1'),
                onTap: () {
                  Provider.of<ThemeModeData>(context, listen: false).setTheme(
                    Color.fromRGBO(25, 167, 206, 1),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Warna 2'),
                onTap: () {
                  Provider.of<ThemeModeData>(context, listen: false).setTheme(
                    Color.fromRGBO(186, 112, 79, 1),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text('Warna 3'),
                onTap: () {
                  Provider.of<ThemeModeData>(context, listen: false).setTheme(
                    Color.fromRGBO(85, 124, 85, 1),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
              ),
            ],
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
