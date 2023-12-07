// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final ImagePicker _imagePicker = ImagePicker();

//   String _imageUrl = '';
//   String username = '';
//   // User? _user;
//   // String? _imageUrl;

//   @override
//   void initState() {
//     super.initState();
//     _getUserData();
//     _getUserData();

//   }

//   Future<void> getUserData() async {
//     User? user = _auth.currentUser;
//     if (user != null) {
//       setState(() {
//         // _user = user;
//       });
//       await _loadProfileImage();
//     }
//   }

//   Future<void> _getUserData() async {
//     try {
//       // Mendapatkan instance user saat ini dari Firebase Authentication
//       User? user = FirebaseAuth.instance.currentUser;

//       // Memeriksa apakah user telah login
//       if (user != null) {
//         // Mendapatkan referensi koleksi pengguna di Firestore
//         CollectionReference users =
//             FirebaseFirestore.instance.collection('users');

//         // Mendapatkan dokumen pengguna berdasarkan ID pengguna saat ini
//         DocumentSnapshot userDocument = await users.doc(user.uid).get();

//         // Mengekstrak data dari dokumen
//         if (userDocument.exists) {
//           Map<String, dynamic> userData =
//               userDocument.data() as Map<String, dynamic>;

//           // Mengakses data pengguna
//           String fetchedUsername = userData['username'];
//           // String fetchedEmail = userData['email'];

//           // Mengupdate state untuk memperbarui tampilan
//           setState(() {
//             username = fetchedUsername;
//             // email = fetchedEmail;
//           });
//         } else {
//           print('Dokumen pengguna tidak ditemukan di Firestore.');
//         }
//       } else {
//         // Jika pengguna belum login, tetapkan nilai default "Anonymous"
//         setState(() {
//           username = 'Anonymous';
//           // email = 'No Email';
//         });
//       }
//     } catch (e) {
//       print('Error saat mengambil data pengguna: $e');
//     }
//   }

//   Future<void> _loadProfileImage() async {
//     Reference storageReference =
//         _storage.ref().child("profile_images/${username}.jpg");

//     try {
//       String downloadURL = await storageReference.getDownloadURL();
//       setState(() {
//         _imageUrl = downloadURL;
//       });
//     } catch (e) {
//       print("Error loading profile image: $e");
//     }
//   }

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await _imagePicker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       File imageFile = File(pickedFile.path);
//       Reference storageReference =
//           _storage.ref().child("profile_images/${username}.jpg");

//       try {
//         await storageReference.putFile(imageFile);
//         _loadProfileImage();
//       } catch (e) {
//         print("Error uploading profile image: $e");
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _imageUrl != null
//                   ? CircleAvatar(
//                       radius: 60,
//                       backgroundImage: NetworkImage(_imageUrl!),
//                     )
//                   : CircleAvatar(
//                       radius: 60,
//                       child: Icon(Icons.person),
//                     ),
//               SizedBox(height: 16),
//               username != null
//                   ? Text('Welcome, ${username}!')
//                   : Text('Welcome to the Home Screen!'),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _pickImage,
//         tooltip: 'Pick Image',
//         child: Icon(Icons.add_a_photo),
//       ),
//     );
//   }
// }
