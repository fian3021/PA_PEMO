import 'dart:io';

import 'package:bantu_bersama/screen/sign_in_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../model/theme_mode_data.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();

  String username = '';
  String email = '';
  String firstName = '';
  String lastName = '';
  String _imageUrl = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      // Mendapatkan instance user saat ini dari Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      // Memeriksa apakah user telah login
      if (user != null) {
        // Mendapatkan referensi koleksi pengguna di Firestore
        CollectionReference users =
            FirebaseFirestore.instance.collection('users');

        // Mendapatkan dokumen pengguna berdasarkan ID pengguna saat ini
        DocumentSnapshot userDocument = await users.doc(user.uid).get();

        // Mengekstrak data dari dokumen
        if (userDocument.exists) {
          Map<String, dynamic> userData =
              userDocument.data() as Map<String, dynamic>;

          // Mengakses data pengguna
          String fetchedUsername = userData['username'];
          String fetchedEmail = userData['email'];
          String fetchedFirstName = userData['firstName'];
          String fetchedLastName = userData['lastName'];

          // Mengupdate state untuk memperbarui tampilan
          setState(() {
            username = fetchedUsername;
            email = fetchedEmail;
            firstName = fetchedFirstName;
            lastName = fetchedLastName;
          });
        } else {
          print('Dokumen pengguna tidak ditemukan di Firestore.');
        }
      } else {
        // Jika pengguna belum login, tetapkan nilai default "Anonymous"
        setState(() {
          username = 'Anonymous';
          email = 'No Email';
        });
      }
    } catch (e) {
      print('Error saat mengambil data pengguna: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      Reference storageReference =
          _storage.ref().child("profile_images/${username}.jpg");

      try {
        await storageReference.putFile(imageFile);

        var downloadURL = await storageReference.getDownloadURL();
        setState(() {
          _imageUrl = downloadURL;
          print("_imageUrl: $_imageUrl");
        });
      } catch (e) {
        print("Error uploading profile image: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;

    if (user == null) {
      return Center(
        child: AlertDialog(
          content: Text(
            'Silahkan login terlebih dahulu',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Provider.of<ThemeModeData>(context).defaultColor,
          title: Center(
            child: Text(
              'Akun Anda',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            _imageUrl != null
                ? CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(_imageUrl),
                  )
                : CircleAvatar(
                    radius: 60,
                    child: Icon(Icons.person),
                  ),
            SizedBox(height: 16),
            Container(
                width: lebar,
                height: tinggi / 4,
                margin: EdgeInsets.all(30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Username',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            username,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama Depan',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            firstName,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama Belakang',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            lastName,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            email,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ]))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          tooltip: 'Pick Image',
          child: Icon(Icons.add_a_photo),
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
        ));
  }
}
