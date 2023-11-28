import 'package:bantu_bersama/screen/sign_in_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController namaDepanController = TextEditingController();
  TextEditingController namaBelakangController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Daftar Akun Anda',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'manusia@gmail.com',
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
                  controller: namaDepanController,
                  decoration: InputDecoration(
                    labelText: 'Nama Depan',
                    hintText: 'masukkan nama depan anda',
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
                  controller: namaBelakangController,
                  decoration: InputDecoration(
                    labelText: 'Nama Belakang',
                    hintText: 'masukkan nama belakang anda',
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pengguna',
                    hintText: 'masukkan nama pengguna anda',
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
              SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi Sandi',
                    hintText: 'Masukkan Ulang Sandi Akun Anda',
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
                padding: const EdgeInsets.fromLTRB(60, 25, 60, 5),
                child: SizedBox(
                  width: lebar,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // String email = emailController.text;
                      // String password = passwordController.text;
                      // // Add your authentication logic here
                      // print('Email: $email, Sandi: $password');
                      // // Kembali ke halaman utama setelah sign-in
                      // // Navigator.push(
                      // //   context,
                      // //   MaterialPageRoute(builder: (context) => SignUp()),
                      // // );
                    },
                    child: Text(
                      'Daftar',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya Akun?",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                    },
                    child: Text(
                      "Masuk",
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
