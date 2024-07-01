// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

import '../../shared/componente.dart';
import '../Login/p_Login.dart';

class codescrean extends StatelessWidget {
  String verificationCode = "";

  codescrean({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: defultColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Almost there ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Please enter the 6-digit code sent to your email hemmyhtec@gmail.com for verification.',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 50.0,
                  child: const TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: TextStyle(fontSize: 24.0, color: Colors.white),
                    decoration: InputDecoration(
                      counterText: "",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 50.0,
                    child: const TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 50.0,
                    child: const TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 50.0,
                    child: const TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 240,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const login(),
                  ),
                );
              },
              child: const Text('Verify'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Did’nt receive any code?',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => codescrean(),
                    ),
                  );
                },
                child: const Text(
                  'Resend Again',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 255, 1),
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Request new code in 00:30s',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: defultColor,
    );
  }
}
