// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:untitled/madules/Register/register_assistant.dart';
import 'package:untitled/madules/Register/register_doctor.dart';
import 'package:untitled/madules/Register/register_patient.dart';
import '../../shared/componente.dart';

class whoscrean extends StatefulWidget {
  const whoscrean({super.key});
  static String id = "whoscrean";
  @override
  State<whoscrean> createState() => _whoscreanState();
}

class _whoscreanState extends State<whoscrean> {
  String _selectedItem = 'Doctor';
  void _navigateToPage(BuildContext context) {
    if (_selectedItem == 'Doctor') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const r_doctor()),
      );
    } else if (_selectedItem == 'Assistant') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const r_assistant()),
      );
    } else if (_selectedItem == 'Patient') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => r_patient()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Image(
                image: AssetImage(
                  'assets/images/logo-1-sos.png',
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: 300,
                    height: 40,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      isDense: true,
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue!;
                        });
                      },
                      items: <String>['Doctor', 'Assistant', 'Patient']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            _navigateToPage(context);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  defultColor2)),
                          child: const Text(
                            'Ok',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ]),
      backgroundColor: Colors.white,
    );
  }
}
