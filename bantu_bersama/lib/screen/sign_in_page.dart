import 'package:bantu_bersama/model/AUTH.dart';
import 'package:bantu_bersama/screen/home_page.dart';
import 'package:bantu_bersama/screen/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_mode_data.dart';

class SignInPage extends StatelessWidget {
  final AuthService _auth = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    // var tinggi = MediaQuery.of(context).size.height;
    InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                child: Container(
                  width: lebar,
                  height: 100,
                  child: Image.asset('assets/Logo.png'),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Masuk ke Akun Anda',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Masukkan Email Anda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelStyle: inputDecorationTheme.labelStyle,
                    hintStyle: inputDecorationTheme.hintStyle,
                    focusedBorder: inputDecorationTheme.focusedBorder,
                  ),
                  obscureText: false,
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Sandi',
                    hintText: 'Masukkan Sandi Akun Anda',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelStyle: inputDecorationTheme.labelStyle,
                    hintStyle: inputDecorationTheme.hintStyle,
                    focusedBorder: inputDecorationTheme.focusedBorder,
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 60, 60, 5),
                child: SizedBox(
                  width: lebar,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      User? user = await _auth.signInWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          context);

                      if (user != null) {
                        // Navigasi ke halaman home setelah login berhasil
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomePage();
                            },
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Masuk',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(lebar, 60),
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Provider.of<ThemeModeData>(context).defaultColor,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya Akun?",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      "Daftar",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
