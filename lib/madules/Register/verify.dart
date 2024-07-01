// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../shared/componente.dart';
import 'codelogin.dart';

class verify extends StatelessWidget {
  const verify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: defultColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/login.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  'Forgot',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                Text(
                  'Password?',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Don\t worry ! It happens. Please enter the phone number we will send the OTP in this phone number.?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 19),
            child: TextField(
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15.0),
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  labelText: 'your number',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
            ),
          ),
          SizedBox(
            width: 250,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => codescrean()));
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
      backgroundColor: defultColor,
    );
  }
}
