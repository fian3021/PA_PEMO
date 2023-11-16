import 'package:bantu_bersama/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      next: Text("Lanjut"),
      done: Text("Mulai"),
      onDone: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return HomePage();
            },
          ),
        );
      },
      pages: [
        PageViewModel(
          title: "Selamat Datang di Aplikasi BantuBersama",
          body: "#BantuBersama",
          image: Container(
              margin: EdgeInsets.only(top: 100), // Atur margin sesuai kebutuhan
              child: Image.asset("assets/logo.png")),
        ),
        PageViewModel(
          title: "Berbagi Kebaikan Itu Mudah",
          body: "#BantuBersama",
          image: Container(
              margin: EdgeInsets.only(top: 100), // Atur margin sesuai kebutuhan
              child: Image.asset("assets/image1.png")),
        ),
        PageViewModel(
          title:
              "Dengan BantuBersama Kita Dapat Membantu Mereka Yang Membutuhkan",
          body: "#BantuBersama",
          image: Container(
              margin: EdgeInsets.only(top: 100), // Atur margin sesuai kebutuhan
              child: Image.asset("assets/image2.png")),
        ),
        PageViewModel(
          title: "Yuk Mulai Berdonasi!",
          body: "#BantuBersama",
          image: Container(
              margin: EdgeInsets.only(top: 100), // Atur margin sesuai kebutuhan
              child: Image.asset("assets/image3.png")),
        ),
      ],
    );
  }
}
