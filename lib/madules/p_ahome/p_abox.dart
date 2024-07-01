// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../../shared/componente.dart';
import '../p_dhome/p_dmap.dart';
import 'p_aprofile.dart';
import 'p_dhelp.dart';
import 'p_dmap.dart';
import 'p_anotifications.dart';
import 'p_asearch.dart';

class p_abox extends StatefulWidget {
  const p_abox({super.key});

  @override
  _p_aboxState createState() => _p_aboxState();
}

class _p_aboxState extends State<p_abox> {
  int _selectedIndex = 0;
  final List<Widget> _pages = <Widget>[
    p_asearch(
      appointments: const [],
    ),
    const p_amap(),
    const p_aprofile(),
    const p_anotifications(),
    const p_ahelp()
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
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.person),
            label: 'Prfile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.notifications),
            label: 'Notification',
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
        backgroundColor: Colors.red,
        selectedItemColor: defultColor,
        unselectedItemColor: defultColor2,
        onTap: _onItemTapped,
      ),
    );
  }
}
