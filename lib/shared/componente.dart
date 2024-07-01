// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/const/onboarding.models.dart';

import '../const/images/image.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong/latlong.dart' as latlong;

var logo = const Image(
  image: AssetImage(
    'assets/images/logo-1-sos.png',
  ),
);
const defultColor = Color.fromARGB(255, 23, 20, 240);
const defultColor2 = Color.fromARGB(255, 102, 100, 100);
var P_profile = const Padding(
  padding: EdgeInsets.only(right: 16.0),
  child: CircleAvatar(
    backgroundImage: AssetImage('assets/images/p_profile.jpg'),
  ),
);

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    required this.validator,
    required this.controller,
  });
  String? Function(String?)? validator;
  TextEditingController? controller;
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        validator: widget.validator,
        obscureText: _obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            labelText: 'Password',
            filled: true,
            fillColor: Colors.white,
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            )),
      ),
    );
  }
}

final onBoardingList = [
  OnBoardingModel(
    title: 'service for you',
    body:
        'The service is suitable for all cases and is provided by specialized experts',
    image: ImagePath.fSplash,
  ),
  OnBoardingModel(
    title: 'Find your health',
    body: 'Fast service,immediate ambulanc service at reasonable prices ',
    image: ImagePath.thSplash,
  ),
  OnBoardingModel(
    title: 'Join A Community',
    body: 'Fast service,immediate ambulanc service at reasonable prices ',
    image: ImagePath.sSplash,
  ),
];
