import 'package:bantu_bersama/screen/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Masuk ke Akun Anda', 
                style: Theme.of(context).textTheme.headlineMedium,),
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
                      'Masuk',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20
                      ),
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
