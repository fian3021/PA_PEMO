import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 150,
        backgroundColor: Color.fromRGBO(121, 176, 183, 0.837),
        shadowColor: Color.fromARGB(0, 0, 0, 0),
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.all(20.0),
          alignment: Alignment.bottomCenter,
          child: CircleAvatar(
            radius: 40.0,
            backgroundColor: Color.fromRGBO(
                217, 217, 217, 1), 
            backgroundImage: AssetImage('assets/your_image.jpg'),
            child: Icon(Icons.account_circle,
                size: 70,
                color: Colors.blueGrey), 
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 45.0),
          Row(
            children: [
              CircleAvatar(
                radius: 9.0,
                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
              ),
              SizedBox(width: 10.0),
              Text(
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 35.0),
          Row(
            children: [
              CircleAvatar(
                radius: 9.0,
                backgroundColor: Color.fromRGBO(217, 217, 217, 1),
              ),
              SizedBox(width: 10.0),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

