// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import '../../shared/componente.dart';
import '../p_dhome/p_dhelp.dart';
import 'amessages.dart';
import 'aprofile.dart';

class assistant extends StatefulWidget {
  const assistant({super.key});
  static const String id = "assistant";

  @override
  State<assistant> createState() => _assistantState();
}

class _assistantState extends State<assistant> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    const A_Messages(),
    const aprofile(),
    const p_dhelp()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            label: 'Prfile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.help_outline,
            ),
            label: 'Help',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: defultColor,
        unselectedItemColor: defultColor2,
        onTap: _onItemTapped,
      ),
    );
  }
}
