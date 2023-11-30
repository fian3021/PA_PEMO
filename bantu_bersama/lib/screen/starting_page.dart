import 'package:bantu_bersama/screen/home_page.dart';
import 'package:bantu_bersama/screen/sign_in_page.dart';
import 'package:flutter/material.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Container(
                  width: lebar,
                  // height: 282,
                  child: Image.asset("assets/Logo.png"),
                ),
              ),
              Text(
                "Selamat Datang di Aplikasi BantuBersama",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "#BantuBersama",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 70, 60, 5),
                child: SizedBox(
                  width: lebar,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    child: Text(
                      'Masuk ke Akun',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(lebar, 60),
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(4, 87, 98, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 10, 60, 5),
                child: SizedBox(
                  width: lebar,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Text(
                      'Lewati',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(lebar, 60),
                      foregroundColor: Color.fromRGBO(4, 87, 98, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
