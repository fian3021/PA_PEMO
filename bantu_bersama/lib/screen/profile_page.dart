import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 79,
        // title: Text('Profile'),
        // titleTextStyle: TextStyle(
        //   color: Color(0xFFC59F4E),
        //   fontSize: 23,
        //   fontWeight: FontWeight.bold,
        // ),
        backgroundColor: Color(0xFF31436D),
        shadowColor: Color.fromARGB(0, 0, 0, 0),
        centerTitle: true,
      ),
    );
  }
}
